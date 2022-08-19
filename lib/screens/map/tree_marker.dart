import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TreeMarker extends StatelessWidget {
  const TreeMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Icon(
      CupertinoIcons.leaf_arrow_circlepath,
      size: 30,
      color: Colors.black,
    ));
  }
}
