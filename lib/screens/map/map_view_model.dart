import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:globo_fitness/store/tree_store.dart';
import 'package:globo_fitness/template/view_model/view_model.dart';

import 'package:api/dependency_injection.dart';

import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/extensions/nullable_check.dart';

// import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart' show LatLng;

part 'map_view_model.g.dart';

class MapViewModel = MapViewModelBase with _$MapViewModel;

abstract class MapViewModelBase with Store, ViewModel {
  final TreeStoreBase treeStore =
      DependecyInjection.instance.get<TreeStoreBase>();

  // final PopupController popupController = PopupController();

  final LatLng parisCoord = LatLng(48.866667, 2.333333);

  final double defaultZoom = 13.0;
  final double maxZoom = 18.0;

  final int heightMarker = 50;
  final int widthMarker = 50;

  @observable
  ObservableList<Marker> treesMarkers = ObservableList();

  @override
  void init() {
    generateMarkers();
  }

  @override
  void dispose() {}

  void generateMarkers() {
    List<Marker> newMarkers = [];

    for (var tree in treeStore.trees) {
      tree.lat.let((that) {
        tree.lng.let((that) {
          newMarkers.add(Marker(
              point: LatLng(tree.lat!, tree.lng!),
              builder: (context) => marker()));
        });
      });
      // if (tree.lat != null && tree.lng != null) {
      //   newMarkers.add(Marker(
      //       point: LatLng(tree.lat!, tree.lng!),
      //       builder: (context) => marker()));
      // }
    }

    treesMarkers.addAll(newMarkers);
  }

  void clearMarkerList() => treesMarkers.clear();

  Widget marker() => ElevatedButton(
      onPressed: () => print("fzefez"), child: const Text('Marker'));
}
