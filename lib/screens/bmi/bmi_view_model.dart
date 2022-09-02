import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/extensions/string_is_numeric.dart';

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
  MeasureSystem _measureSystem = MeasureSystem.metric;
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
    initializeReactions();
  }

  List<bool> _generateIsSelected() => [
        _measureSystem == MeasureSystem.metric,
        _measureSystem == MeasureSystem.imperial
      ];

  void initializeReactions() {
    variablesChangedReaction = reaction((_) => [_heightText, _weightText],
        (_) => tryToComputeBMI(_heightText, _weightText));
  }

  void resetTextFields() {
    txtHeightController.clear();
    txtWeightController.clear();
    _errorBMI = ErrorBMI.nullFields;
  }

  bool _shouldSwitchMeasureUnit(int index) =>
      (_measureSystem == MeasureSystem.metric && index != 0) ||
      (_measureSystem == MeasureSystem.imperial && index != 1);

  @action
  void toggleMeasure(index) {
    if (_shouldSwitchMeasureUnit(index)) {
      _measureSystem =
          index == 0 ? MeasureSystem.metric : MeasureSystem.imperial;
      isSelected = _generateIsSelected();

      resetTextFields();
    }
  }

  @action
  void setHeight(String value) => _heightText = value;
  @action
  void setWeight(String value) => _weightText = value;

  String getHeightUnitHint(BuildContext context) {
    switch (_measureSystem) {
      case MeasureSystem.metric:
        return LocaleKeys.meters.tr();
      case MeasureSystem.imperial:
        return LocaleKeys.inch.tr();
    }
  }

  String getWeightUnitHint(BuildContext context) {
    switch (_measureSystem) {
      case MeasureSystem.metric:
        return LocaleKeys.kilos.tr();
      case MeasureSystem.imperial:
        return LocaleKeys.pounds.tr();
    }
  }

  String getBmiString(BuildContext context) {
    switch (_errorBMI) {
      case ErrorBMI.format:
        return LocaleKeys.formatError.tr();
      case ErrorBMI.nullFields:
        return LocaleKeys.bmiErrorNull.tr();
      case ErrorBMI.noError:
        return LocaleKeys.bmiResult
            .tr(namedArgs: {'value': _bmi.toStringAsFixed(2)});
    }
  }

  void tryToComputeBMI(String? heightValue, String? weightValue) {
    if (canCalculateBMI(heightValue, weightValue)) {
      computeInfos(heightValue!, weightValue!);
    }
  }

  bool canCalculateBMI(String? heightValue, String? weightValue) {
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

  void computeInfos(String heightValue, String weightValue) {
    double height = double.tryParse(heightValue) ?? 0;
    double weight = double.tryParse(weightValue) ?? 0;
    double multiplier = _measureSystem == MeasureSystem.metric ? 1 : 703;
    _bmi = weight * multiplier / (height * height);
  }
}
