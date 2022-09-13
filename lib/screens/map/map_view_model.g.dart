// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapViewModel on MapViewModelBase, Store {
  late final _$centerCurrentLocationStreamControllerAtom = Atom(
      name: 'MapViewModelBase.centerCurrentLocationStreamController',
      context: context);

  @override
  StreamController<double?> get centerCurrentLocationStreamController {
    _$centerCurrentLocationStreamControllerAtom.reportRead();
    return super.centerCurrentLocationStreamController;
  }

  @override
  set centerCurrentLocationStreamController(StreamController<double?> value) {
    _$centerCurrentLocationStreamControllerAtom
        .reportWrite(value, super.centerCurrentLocationStreamController, () {
      super.centerCurrentLocationStreamController = value;
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

  late final _$centerOnLocationUpdateAtom =
      Atom(name: 'MapViewModelBase.centerOnLocationUpdate', context: context);

  @override
  CenterOnLocationUpdate get centerOnLocationUpdate {
    _$centerOnLocationUpdateAtom.reportRead();
    return super.centerOnLocationUpdate;
  }

  @override
  set centerOnLocationUpdate(CenterOnLocationUpdate value) {
    _$centerOnLocationUpdateAtom
        .reportWrite(value, super.centerOnLocationUpdate, () {
      super.centerOnLocationUpdate = value;
    });
  }

  late final _$determinePositionAsyncAction =
      AsyncAction('MapViewModelBase.determinePosition', context: context);

  @override
  Future<Position> determinePosition(BuildContext context) {
    return _$determinePositionAsyncAction
        .run(() => super.determinePosition(context));
  }

  late final _$MapViewModelBaseActionController =
      ActionController(name: 'MapViewModelBase', context: context);

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
  String toString() {
    return '''
centerCurrentLocationStreamController: ${centerCurrentLocationStreamController},
treesMarkers: ${treesMarkers},
centerOnLocationUpdate: ${centerOnLocationUpdate}
    ''';
  }
}
