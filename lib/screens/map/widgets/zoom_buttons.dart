import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

class FlutterMapZoomButtons extends StatelessWidget {
  final double minZoom;
  final double maxZoom;
  final double padding;
  final Alignment alignment;
  final bool isMini;
  final IconData zoomInIcon;
  final IconData zoomOutIcon;
  final Color? zoomInColor;
  final Color? zoomInColorIcon;
  final Color? zoomOutColor;
  final Color? zoomOutColorIcon;

  final MapController mapController;

  const FlutterMapZoomButtons(
      {super.key,
      required this.mapController,
      this.minZoom = 1,
      this.maxZoom = 18,
      this.padding = 2.0,
      this.alignment = Alignment.topRight,
      this.isMini = true,
      this.zoomInIcon = Icons.zoom_in,
      this.zoomOutIcon = Icons.zoom_out,
      this.zoomInColor,
      this.zoomInColorIcon,
      this.zoomOutColor,
      this.zoomOutColorIcon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _getZoomButton(context: context, isZoomIn: true),
          _getZoomButton(context: context, isZoomIn: false)
        ],
      ),
    );
  }

  Padding _getZoomButton(
          {required BuildContext context, required bool isZoomIn}) =>
      Padding(
        padding: isZoomIn
            ? EdgeInsets.only(left: padding, top: padding, right: padding)
            : EdgeInsets.all(padding),
        child: FloatingActionButton(
          heroTag: isZoomIn ? 'zoomInButton' : 'zoomOutButton',
          mini: isMini,
          backgroundColor: (isZoomIn ? zoomInColor : zoomOutColor) ??
              Theme.of(context).primaryColorDark,
          onPressed: isZoomIn ? _onPressedZoomIn : _onPressedZoomOut,
          child: Icon(isZoomIn ? zoomInIcon : zoomOutIcon,
              color: (isZoomIn ? zoomInColorIcon : zoomOutColorIcon) ??
                  Colors.black),
        ),
      );

  void _onPressedZoomOut() {
    if (mapController.zoom != minZoom) {
      mapController.move(mapController.center, mapController.zoom - 1);
    }
  }

  void _onPressedZoomIn() {
    if (mapController.zoom != maxZoom) {
      mapController.move(mapController.center, mapController.zoom + 1);
    }
  }
}
