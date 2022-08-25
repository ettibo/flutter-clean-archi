import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

import 'package:api/models/app/tree/tree.dart';

class TreeMarker extends Marker {
  final Tree tree;

  TreeMarker({required this.tree})
      : super(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          height: 30,
          width: 30,
          point: LatLng(tree.lat ?? 0.0, tree.lng ?? 0.0),
          builder: (BuildContext context) => const Icon(
              CupertinoIcons.leaf_arrow_circlepath,
              color: Colors.black),
        );
}
