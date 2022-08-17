// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BmiViewModel on BmiViewModelBase, Store {
  late final _$txtHeightControllerAtom =
      Atom(name: 'BmiViewModelBase.txtHeightController', context: context);

  @override
  TextEditingController get txtHeightController {
    _$txtHeightControllerAtom.reportRead();
    return super.txtHeightController;
  }

  @override
  set txtHeightController(TextEditingController value) {
    _$txtHeightControllerAtom.reportWrite(value, super.txtHeightController, () {
      super.txtHeightController = value;
    });
  }

  late final _$txtWeightControllerAtom =
      Atom(name: 'BmiViewModelBase.txtWeightController', context: context);

  @override
  TextEditingController get txtWeightController {
    _$txtWeightControllerAtom.reportRead();
    return super.txtWeightController;
  }

  @override
  set txtWeightController(TextEditingController value) {
    _$txtWeightControllerAtom.reportWrite(value, super.txtWeightController, () {
      super.txtWeightController = value;
    });
  }

  late final _$_measureSystemAtom =
      Atom(name: 'BmiViewModelBase._measureSystem', context: context);

  @override
  MeasureSystem get _measureSystem {
    _$_measureSystemAtom.reportRead();
    return super._measureSystem;
  }

  @override
  set _measureSystem(MeasureSystem value) {
    _$_measureSystemAtom.reportWrite(value, super._measureSystem, () {
      super._measureSystem = value;
    });
  }

  late final _$_errorBMIAtom =
      Atom(name: 'BmiViewModelBase._errorBMI', context: context);

  @override
  ErrorBMI get _errorBMI {
    _$_errorBMIAtom.reportRead();
    return super._errorBMI;
  }

  @override
  set _errorBMI(ErrorBMI value) {
    _$_errorBMIAtom.reportWrite(value, super._errorBMI, () {
      super._errorBMI = value;
    });
  }

  late final _$_bmiAtom = Atom(name: 'BmiViewModelBase._bmi', context: context);

  @override
  double get _bmi {
    _$_bmiAtom.reportRead();
    return super._bmi;
  }

  @override
  set _bmi(double value) {
    _$_bmiAtom.reportWrite(value, super._bmi, () {
      super._bmi = value;
    });
  }

  late final _$_heightTextAtom =
      Atom(name: 'BmiViewModelBase._heightText', context: context);

  @override
  String get _heightText {
    _$_heightTextAtom.reportRead();
    return super._heightText;
  }

  @override
  set _heightText(String value) {
    _$_heightTextAtom.reportWrite(value, super._heightText, () {
      super._heightText = value;
    });
  }

  late final _$_weightTextAtom =
      Atom(name: 'BmiViewModelBase._weightText', context: context);

  @override
  String get _weightText {
    _$_weightTextAtom.reportRead();
    return super._weightText;
  }

  @override
  set _weightText(String value) {
    _$_weightTextAtom.reportWrite(value, super._weightText, () {
      super._weightText = value;
    });
  }

  late final _$BmiViewModelBaseActionController =
      ActionController(name: 'BmiViewModelBase', context: context);

  @override
  void process() {
    final _$actionInfo = _$BmiViewModelBaseActionController.startAction(
        name: 'BmiViewModelBase.process');
    try {
      return super.process();
    } finally {
      _$BmiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleMeasure(dynamic index) {
    final _$actionInfo = _$BmiViewModelBaseActionController.startAction(
        name: 'BmiViewModelBase.toggleMeasure');
    try {
      return super.toggleMeasure(index);
    } finally {
      _$BmiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeight(String value) {
    final _$actionInfo = _$BmiViewModelBaseActionController.startAction(
        name: 'BmiViewModelBase.setHeight');
    try {
      return super.setHeight(value);
    } finally {
      _$BmiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWeight(String value) {
    final _$actionInfo = _$BmiViewModelBaseActionController.startAction(
        name: 'BmiViewModelBase.setWeight');
    try {
      return super.setWeight(value);
    } finally {
      _$BmiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
txtHeightController: ${txtHeightController},
txtWeightController: ${txtWeightController}
    ''';
  }
}
