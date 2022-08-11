import 'package:flutter/material.dart';
import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/shared/app_bar.dart';
import 'package:globo_fitness/localization/app_localization_context.dart';

import 'package:globo_fitness/screens/tree_detail/tree_info.dart';

class TreeDetailScreen extends StatefulWidget {
  final Tree tree;
  const TreeDetailScreen({Key? key, required this.tree}) : super(key: key);

  @override
  State<TreeDetailScreen> createState() => _TreeDetailScreenState();
}

class _TreeDetailScreenState extends State<TreeDetailScreen> {
  AppBar materialAppBar(BuildContext context) => appBar(
      title: Text(widget.tree.name ?? context.localized.treeWithoutName));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: materialAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowTreeInfo(
                  context: context,
                  title: context.localized.species,
                  value: widget.tree.species ??
                      context.localized.speciesNotSpecified),
              rowTreeInfo(
                  context: context,
                  title: context.localized.address,
                  value: '${widget.tree.address2} ${widget.tree.address}'),
              rowTreeInfo(
                  context: context,
                  title: context.localized.height,
                  value: widget.tree.height.toString(),
                  unit: context.localized.meterUnit),
              rowTreeInfo(
                  context: context,
                  title: context.localized.circumference,
                  value: widget.tree.circumference.toString(),
                  unit: context.localized.centimeterUnit),
            ],
          ),
        ),
      ),
    );
  }
}
