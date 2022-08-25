import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/screens/map/widgets/zoom_buttons.dart';
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
    viewModel
        .determinePosition(context)
        .then(viewModel.centerOnUserAfterGettingLocation);
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
            mapController: viewModel.mapController,
            options: MapOptions(
              center: viewModel.parisCoord,
              zoom: viewModel.defaultZoom,
              maxZoom: viewModel.maxZoom,
              plugins: [
                MarkerClusterPlugin(),
              ],
            ),
            nonRotatedChildren: [
              viewModel.centerOnLocationUpdate == CenterOnLocationUpdate.never
                  ? const SizedBox.shrink()
                  : _centerOnUserButton()
            ],
            layers: [
              MarkerClusterLayerOptions(
                maxClusterRadius: viewModel.maxClusterRadius,
                size: viewModel.clusterSize,
                fitBoundsOptions: viewModel.fitBoundsOptions,
                markers: viewModel.treesMarkers,
                polygonOptions: viewModel.polygonOptions,
                builder: _clusterBuilder,
              ),
            ],
            children: <Widget>[
              TileLayerWidget(
                options: viewModel.tileLayerOptions,
              ),
              viewModel.displayUserLocationIfGranted(),
              FlutterMapZoomButtons(
                minZoom: viewModel.minZoom,
                maxZoom: viewModel.maxZoom,
                alignment: Alignment.bottomLeft,
                onPressedZoomIn: viewModel.onPressedZoomIn,
                onPressedZoomOut: viewModel.onPressedZoomOut,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _clusterBuilder(BuildContext context, List<Marker> markers) =>
      FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: null,
        child: Text(markers.length.toString()),
      );

  Widget _centerOnUserButton() => Positioned(
        right: 20,
        bottom: 20,
        child: FloatingActionButton(
          onPressed: viewModel.centerOnUser,
          backgroundColor: Theme.of(context).primaryColorDark,
          child: const Icon(
            Icons.my_location,
            color: Colors.black,
          ),
        ),
      );
}
