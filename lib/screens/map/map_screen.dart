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

  late TileLayerOptions tileLayerOptions;

  @override
  void initState() {
    super.initState();
    viewModel.init();
    initTileLayerOptions();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void initTileLayerOptions() {
    tileLayerOptions = TileLayerOptions(
        urlTemplate: viewModel.openStreetMapUrl,
        subdomains: viewModel.tileLayerOptionsSubdomains);
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
            ),
            layers: [
              MarkerClusterLayerOptions(
                maxClusterRadius: viewModel.maxClusterRadius,
                size: viewModel.clusterSize,
                fitBoundsOptions: fitBoundsOptions,
                markers: viewModel.treesMarkers,
                polygonOptions: polygonOptions,
                builder: clusterBuilder,
              ),
            ],
            children: <Widget>[
              TileLayerWidget(
                options: tileLayerOptions,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  FitBoundsOptions fitBoundsOptions = const FitBoundsOptions(
    padding: EdgeInsets.all(50),
  );

  PolygonOptions polygonOptions =
      const PolygonOptions(borderColor: Colors.black, borderStrokeWidth: 3);

  Widget clusterBuilder(BuildContext context, List<Marker> markers) =>
      FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: null,
        child: Text(markers.length.toString()),
      );
}
