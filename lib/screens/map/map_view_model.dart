import 'dart:async';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' show LatLng;

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/screens/map/tree_marker.dart';

import 'package:globo_fitness/store/tree_store.dart';

import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:globo_fitness/extensions/nullable_check.dart';

part 'map_view_model.g.dart';

class MapViewModel = MapViewModelBase with _$MapViewModel;

abstract class MapViewModelBase with Store, ViewModel {
  final TreeStoreBase treeStore =
      DependecyInjection.instance.get<TreeStoreBase>();

  final LatLng parisCoord = LatLng(48.866667, 2.333333);
  final double defaultZoom = 13.0;
  final double maxZoom = 18.0;
  final int heightMarker = 50;
  final int widthMarker = 50;
  final int maxClusterRadius = 120;
  final Size clusterSize = const Size(40, 40);

  final String openStreetMapUrl =
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  final List<String> tileLayerOptionsSubdomains = ['a', 'b', 'c'];

  late MapController mapController;
  late TileLayerOptions tileLayerOptions;

  @observable
  ObservableList<Marker> treesMarkers = ObservableList();

  @observable
  CenterOnLocationUpdate centerOnLocationUpdate = CenterOnLocationUpdate.never;

  StreamController<double?> centerCurrentLocationStreamController =
      StreamController<double?>();

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
    centerCurrentLocationStreamController = StreamController<double?>();
    mapController = MapController();
    _determinePosition();
    _initTileLayerOptions();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    centerOnLocationUpdate = CenterOnLocationUpdate.once;
    return await Geolocator.getCurrentPosition();
  }

  void _initTileLayerOptions() {
    tileLayerOptions = TileLayerOptions(
        urlTemplate: openStreetMapUrl, subdomains: tileLayerOptionsSubdomains);
  }

  void _generateMarkers() {
    List<Marker> newMarkers = [];

    for (var tree in treeStore.trees) {
      tree.lat.let((that) {
        tree.lng.let((that) {
          newMarkers.add(Marker(
              point: LatLng(tree.lat!, tree.lng!),
              builder: (context) => treeMarker()));
        });
      });
    }

    treesMarkers.addAll(newMarkers);
  }

  // Dispose Methods
  void _disposeCenterLocStream() {
    centerCurrentLocationStreamController.close();
  }

  void _disposeMap() {
    _disposeCenterLocStream();
    mapController.dispose();
  }

  void _clearMarkerList() => treesMarkers.clear();

  // Methods
  Widget treeMarker() => const TreeMarker();

  @action
  void onCenterOnUserPressed() {
    centerOnLocationUpdate = CenterOnLocationUpdate.once;
    centerCurrentLocationStreamController.add(mapController.zoom);
  }

  // Map Options
  FitBoundsOptions fitBoundsOptions = const FitBoundsOptions(
    padding: EdgeInsets.all(50),
  );

  PolygonOptions polygonOptions =
      const PolygonOptions(borderColor: Colors.black, borderStrokeWidth: 3);
}
