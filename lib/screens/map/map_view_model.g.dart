// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapViewModel on MapViewModelBase, Store {
  late final _$_locationAllowedAtom =
      Atom(name: 'MapViewModelBase._locationAllowed', context: context);

  @override
  bool get _locationAllowed {
    _$_locationAllowedAtom.reportRead();
    return super._locationAllowed;
  }

  @override
  set _locationAllowed(bool value) {
    _$_locationAllowedAtom.reportWrite(value, super._locationAllowed, () {
      super._locationAllowed = value;
    });
  }

  late final _$treesMarkersAtom =
      Atom(name: 'MapViewModelBase.treesMarkers', context: context);

  @override
  ObservableList<Marker> get treesMarkers {
    _$treesMarkersAtom.reportRead();
    return super.treesMarkers;
  }

  @override
  set treesMarkers(ObservableList<Marker> value) {
    _$treesMarkersAtom.reportWrite(value, super.treesMarkers, () {
      super.treesMarkers = value;
    });
  }

  late final _$popupLayerControllerAtom =
      Atom(name: 'MapViewModelBase.popupLayerController', context: context);

  @override
  PopupController get popupLayerController {
    _$popupLayerControllerAtom.reportRead();
    return super.popupLayerController;
  }

  @override
  set popupLayerController(PopupController value) {
    _$popupLayerControllerAtom.reportWrite(value, super.popupLayerController,
        () {
      super.popupLayerController = value;
    });
  }

  late final _$MapViewModelBaseActionController =
      ActionController(name: 'MapViewModelBase', context: context);

  @override
  void centerOnUserIfLocationGranted(Position _) {
    final _$actionInfo = _$MapViewModelBaseActionController.startAction(
        name: 'MapViewModelBase.centerOnUserIfLocationGranted');
    try {
      return super.centerOnUserIfLocationGranted(_);
    } finally {
      _$MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateMarkers() {
    final _$actionInfo = _$MapViewModelBaseActionController.startAction(
        name: 'MapViewModelBase._updateMarkers');
    try {
      return super._updateMarkers();
    } finally {
      _$MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void centerOnUser() {
    final _$actionInfo = _$MapViewModelBaseActionController.startAction(
        name: 'MapViewModelBase.centerOnUser');
    try {
      return super.centerOnUser();
    } finally {
      _$MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget mapPopupBuilder(BuildContext _, Marker marker) {
    final _$actionInfo = _$MapViewModelBaseActionController.startAction(
        name: 'MapViewModelBase.mapPopupBuilder');
    try {
      return super.mapPopupBuilder(_, marker);
    } finally {
      _$MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
treesMarkers: ${treesMarkers},
popupLayerController: ${popupLayerController}
    ''';
  }
}
