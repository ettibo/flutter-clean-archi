import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/screens/map/map_view_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapViewModelBase viewModel =
      DependecyInjection.instance.get<MapViewModelBase>();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Observer(
          builder: (context) => FlutterMap(
            options: MapOptions(
              center: viewModel.parisCoord,
              zoom: viewModel.defaultZoom,
              maxZoom: viewModel.maxZoom,
              plugins: [
                MarkerClusterPlugin(),
              ],
              // onTap: (_, __) => viewModel.popupController
              //     .hideAllPopups(), // Hide popup when the map is tapped.
            ),
            layers: [
              MarkerLayerOptions(
                markers: viewModel.treesMarkers,
              ),
            ],
            children: <Widget>[
              TileLayerWidget(
                options: TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  // void process() {
  //   pointIndex = 0;
  //   markers = [
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: points[pointIndex],
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(53.3498, -6.2603),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(53.3488, -6.2613),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(53.3488, -6.2613),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(48.8566, 2.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //     Marker(
  //       anchorPos: AnchorPos.align(AnchorAlign.center),
  //       height: 30,
  //       width: 30,
  //       point: LatLng(49.8566, 3.3522),
  //       builder: (ctx) => const Icon(Icons.pin_drop),
  //     ),
  //   ];
  // }

}
