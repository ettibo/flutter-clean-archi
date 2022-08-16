// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsViewModel on SettingsViewModelBase, Store {
  late final _$currentThemeAtom =
      Atom(name: 'SettingsViewModelBase.currentTheme', context: context);

  @override
  DeviceTheme get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(DeviceTheme value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  late final _$SettingsViewModelBaseActionController =
      ActionController(name: 'SettingsViewModelBase', context: context);

  @override
  void setCurrentTheme() {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.setCurrentTheme');
    try {
      return super.setCurrentTheme();
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme}
    ''';
  }
}
