// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart'
    show TapPosition;

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/screens/map/widgets/markers/tree_marker.dart';
import 'package:globo_fitness/screens/map/widgets/markers/tree_marker_popup.dart';

import 'package:globo_fitness/store/tree_store.dart';
import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/extensions/nullable_check.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

part 'map_view_model.g.dart';

class MapViewModel = MapViewModelBase with _$MapViewModel;

abstract class MapViewModelBase with Store, ViewModel {
  final TreeStoreBase _treeStore =
      DependecyInjection.instance.get<TreeStoreBase>();

  final LatLng parisCoord = LatLng(48.866667, 2.333333);
  final double defaultZoom = 13.0;
  final double minZoom = 4.0;
  final double maxZoom = 18.0;
  final int heightMarker = 50;
  final int widthMarker = 50;
  final int maxClusterRadius = 120;
  final Size clusterSize = const Size(40, 40);

  final String openStreetMapUrl =
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  final List<String> tileLayerOptionsSubdomains = ['a', 'b', 'c'];

  final PopupController popupLayerController = PopupController();

  late MapController mapController;
  late TileLayerOptions tileLayerOptions;

  @observable
  StreamController<double?> centerCurrentLocationStreamController =
      StreamController<double?>();

  @observable
  ObservableList<Marker> treesMarkers = ObservableList();

  @observable
  CenterOnLocationUpdate centerOnLocationUpdate = CenterOnLocationUpdate.once;

  @override
  void init() {
    _initMap();
    _generateMarkers();
  }

  @override
  void dispose() {
    _clearMarkerList();
    _disposeMap();
  }

  // Init Methods
  void _initMap() {
    mapController = MapController();
    centerCurrentLocationStreamController = StreamController<double?>();
    _initTileLayerOptions();
  }

  @action
  Future<Position> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(
          LocaleKeys.setting_screen_location_services_disabled.localized());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
            LocaleKeys.setting_screen_location_permission_denied.localized());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(LocaleKeys
          .setting_screen_location_permission_denied_permanently
          .localized());
    }
    return await Geolocator.getCurrentPosition();
  }

  void _initTileLayerOptions() => tileLayerOptions = TileLayerOptions(
      urlTemplate: openStreetMapUrl, subdomains: tileLayerOptionsSubdomains);

  void _generateMarkers() {
    List<Marker> newMarkers = [];

    for (var tree in _treeStore.trees) {
      tree.lat.let((that) {
        tree.lng.let((that) {
          newMarkers.add(TreeMarker(tree: tree));
        });
      });
    }
    treesMarkers.addAll(newMarkers.sublist(treesMarkers.length));
  }

  void centerOnUserAfterGettingLocation(Position position) => centerOnUser();

  void _disposeMap() {
    mapController.dispose();
    centerCurrentLocationStreamController.close();
  }

  void _clearMarkerList() => treesMarkers.clear();

  // Methods
  @action
  void centerOnUser() {
    centerOnLocationUpdate = CenterOnLocationUpdate.once;
    centerCurrentLocationStreamController.add(mapController.zoom);
  }

  Widget displayCenterOnUserButton({required Widget widget}) =>
      centerOnLocationUpdate == CenterOnLocationUpdate.never
          ? const SizedBox.shrink()
          : widget;

  Widget displayUserLocationIfGranted() =>
      centerOnLocationUpdate == CenterOnLocationUpdate.never
          ? const SizedBox.shrink()
          : LocationMarkerLayerWidget(
              plugin: LocationMarkerPlugin(
                centerOnLocationUpdate: centerOnLocationUpdate,
                centerCurrentLocationStream:
                    centerCurrentLocationStreamController.stream,
                turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
              ),
            );

  void onPressedZoomOut() {
    if (mapController.zoom != minZoom) {
      mapController.move(mapController.center, mapController.zoom - 1);
    }
  }

  void onPressedZoomIn() {
    if (mapController.zoom != maxZoom) {
      mapController.move(mapController.center, mapController.zoom + 1);
    }
  }

  void onTapMap(TapPosition tapPosition, LatLng latLng) =>
      popupLayerController.hideAllPopups();

  Widget mapPopupBuilder(BuildContext _, Marker marker) =>
      (marker is TreeMarker)
          ? TreeMarkPopup(tree: marker.tree)
          : const SizedBox.shrink();

  // Map Options
  FitBoundsOptions fitBoundsOptions = const FitBoundsOptions(
    padding: EdgeInsets.all(50),
  );

  PolygonOptions polygonOptions =
      const PolygonOptions(borderColor: Colors.black, borderStrokeWidth: 3);
}
