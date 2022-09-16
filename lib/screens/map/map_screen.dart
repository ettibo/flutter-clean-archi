import 'package:flutter/material.dart';

import 'package:focus_detector/focus_detector.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

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
    return SafeArea(
      child: Center(
        child: _builder(context),
      ),
    );
  }

  void _onVisibilityGained() => setState(() => viewModel.generateMarkers());

  Widget _builder(BuildContext context) => FocusDetector(
        onVisibilityGained: _onVisibilityGained,
        child: Column(
          children: [
            Expanded(
              child: FlutterMap(
                mapController: viewModel.mapController,
                options: MapOptions(
                  center: viewModel.parisCoord,
                  zoom: viewModel.defaultZoom,
                  maxZoom: viewModel.maxZoom,
                  onTap: viewModel.onTapMap,
                  plugins: [
                    MarkerClusterPlugin(),
                  ],
                ),
                nonRotatedChildren: [
                  viewModel.displayCenterOnUserButton(
                      widget: _centerOnUserButton()),
                  // Zoom Buttons
                  FlutterMapZoomButtons(
                    alignment: Alignment.bottomLeft,
                    onPressedZoomIn: viewModel.onPressedZoomIn,
                    onPressedZoomOut: viewModel.onPressedZoomOut,
                  ),
                ],
                children: <Widget>[
                  TileLayerWidget(
                    options: viewModel.tileLayerOptions,
                  ),

                  // Center on User Button
                  viewModel.displayUserLocationIfGranted(),

                  //Cluster & Popup Options
                  MarkerClusterLayerWidget(
                    key: UniqueKey(),
                    options: MarkerClusterLayerOptions(
                      maxClusterRadius: viewModel.maxClusterRadius,
                      size: viewModel.clusterSize,
                      fitBoundsOptions: viewModel.fitBoundsOptions,
                      markers: viewModel.treesMarkers,
                      polygonOptions: viewModel.polygonOptions,
                      builder: _clusterBuilder,
                      popupOptions: PopupOptions(
                        popupController: viewModel.popupLayerController,
                        popupBuilder: viewModel.mapPopupBuilder,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _clusterBuilder(BuildContext context, List<Marker> markers) =>
      FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: null,
        child: Text(markers.length.toString()),
      );

  Widget _centerOnUserButton() => Positioned(
        right: 20,
        bottom: 20,
        child: FloatingActionButton(
          onPressed: viewModel.centerOnUser,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            PlatformIcons(context).location,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      );
}
