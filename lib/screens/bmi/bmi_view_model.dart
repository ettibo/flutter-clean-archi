import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

import 'package:globo_fitness/extensions/string_is_numeric.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/extensions/nullable_check.dart';

part 'bmi_view_model.g.dart';

enum MeasureSystem { metric, imperial }

enum ErrorBMI { format, nullFields, noError }

class BmiViewModel = BmiViewModelBase with _$BmiViewModel;

abstract class BmiViewModelBase with Store, ViewModel {
  @observable
  TextEditingController txtHeightController = TextEditingController();
  @observable
  TextEditingController txtWeightController = TextEditingController();

  @observable
  MeasureSystem measureSystem = MeasureSystem.metric;
  @observable
  ErrorBMI _errorBMI = ErrorBMI.nullFields;

  @observable
  double _bmi = 0;

  @observable
  String _heightText = '';
  @observable
  String _weightText = '';

  FocusNode weightFocusNode = FocusNode();

  late List<bool> isSelected;
  late ReactionDisposer variablesChangedReaction;

  @override
  void init() {
    process();
  }

  @override
  void dispose() {
    variablesChangedReaction();
  }

  @action
  void process() {
    isSelected = _generateIsSelected();
    _initializeReactions();
  }

  List<bool> _generateIsSelected() => [
        measureSystem == MeasureSystem.metric,
        measureSystem == MeasureSystem.imperial
      ];

  void _initializeReactions() => variablesChangedReaction = reaction(
      (_) => [_heightText, _weightText],
      (_) => _tryToComputeBMI(_heightText, _weightText));

  void _resetTextFields() {
    txtHeightController.clear();
    txtWeightController.clear();
    _errorBMI = ErrorBMI.nullFields;
  }

  bool _shouldSwitchMeasureUnit(int index) =>
      (measureSystem == MeasureSystem.metric && index != 0) ||
      (measureSystem == MeasureSystem.imperial && index != 1);

  @action
  void toggleMeasureMaterial(int index) {
    if (_shouldSwitchMeasureUnit(index)) {
      measureSystem =
          index == 0 ? MeasureSystem.metric : MeasureSystem.imperial;
      isSelected = _generateIsSelected();

      _resetTextFields();
    }
  }

  @action
  void toggleMeasureCupertino(dynamic newMeasureSystem) {
    MeasureSystem? castedNewMeasureSystem = newMeasureSystem as MeasureSystem;
    castedNewMeasureSystem.let((that) {
      if (castedNewMeasureSystem != measureSystem) {
        measureSystem = measureSystem == MeasureSystem.imperial
            ? MeasureSystem.metric
            : MeasureSystem.imperial;

        isSelected = _generateIsSelected();
        _resetTextFields();
      }
    });
  }

  @action
  void setHeight(String value) => _heightText = value;
  @action
  void setWeight(String value) => _weightText = value;

  String getHeightUnitHint(BuildContext context) {
    switch (measureSystem) {
      case MeasureSystem.metric:
        return LocaleKeys.bmi_screen_meters.localized();
      case MeasureSystem.imperial:
        return LocaleKeys.bmi_screen_inch.localized();
    }
  }

  String getWeightUnitHint(BuildContext context) {
    switch (measureSystem) {
      case MeasureSystem.metric:
        return LocaleKeys.bmi_screen_kilos.localized();
      case MeasureSystem.imperial:
        return LocaleKeys.bmi_screen_pounds.localized();
    }
  }

  String getBmiString(BuildContext context) {
    switch (_errorBMI) {
      case ErrorBMI.format:
        return LocaleKeys.bmi_screen_format_error.localized();
      case ErrorBMI.nullFields:
        return LocaleKeys.bmi_screen_bmi_error_null.localized();
      case ErrorBMI.noError:
        return LocaleKeys.bmi_screen_bmi_result
            .localized(args: {'value': _bmi.toStringAsFixed(2)});
    }
  }

  void _tryToComputeBMI(String? heightValue, String? weightValue) {
    if (_canCalculateBMI(heightValue, weightValue)) {
      _computeInfos(heightValue!, weightValue!);
    }
  }

  bool _canCalculateBMI(String? heightValue, String? weightValue) {
    if (heightValue == null ||
        heightValue.isEmpty ||
        weightValue == null ||
        weightValue.isEmpty) {
      _errorBMI = ErrorBMI.nullFields;
      return false;
    }

    if (!weightValue.isNumeric() || !_heightText.isNumeric()) {
      _errorBMI = ErrorBMI.format;
      return false;
    }
    _errorBMI = ErrorBMI.noError;
    return true;
  }

  void _computeInfos(String heightValue, String weightValue) {
    double height = double.tryParse(heightValue) ?? 0;
    double weight = double.tryParse(weightValue) ?? 0;
    double multiplier = measureSystem == MeasureSystem.metric ? 1 : 703;
    _bmi = weight * multiplier / (height * height);
  }
}
