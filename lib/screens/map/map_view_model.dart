import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:latlong2/latlong.dart' show LatLng;
import 'package:flutter_map/flutter_map.dart';

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

  @observable
  ObservableList<Marker> treesMarkers = ObservableList();

  @override
  void init() {
    generateMarkers();
  }

  @override
  void dispose() {
    clearMarkerList();
  }

  void generateMarkers() {
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

  void clearMarkerList() => treesMarkers.clear();

  Widget treeMarker() => const TreeMarker();
}
