import 'package:flutter/material.dart';
import 'package:api/models/app/tree/tree.dart';

import 'package:globo_fitness/shared/material_app_bar.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:globo_fitness/screens/tree_detail/tree_info.dart';

class TreeDetailScreen extends StatefulWidget {
  final Tree tree;
  const TreeDetailScreen({Key? key, required this.tree}) : super(key: key);

  @override
  State<TreeDetailScreen> createState() => _TreeDetailScreenState();
}

class _TreeDetailScreenState extends State<TreeDetailScreen> {
  AppBar appBar(BuildContext context) => materialAppBar(
      title: widget.tree.name ?? LocaleKeys.title_titledetailTreePage.tr());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowTreeInfo(
                  context: context,
                  title: LocaleKeys.treeScreen_species.tr(),
                  value: widget.tree.species ??
                      LocaleKeys.treeScreen_speciesNotSpecified.tr()),
              rowTreeInfo(
                  context: context,
                  title: LocaleKeys.treeScreen_address.tr(),
                  value: '${widget.tree.address2} ${widget.tree.address}'),
              rowTreeInfo(
                  context: context,
                  title: LocaleKeys.treeScreen_height.tr(),
                  value: widget.tree.height.toString(),
                  unit: LocaleKeys.treeScreen_meterUnit.tr()),
              rowTreeInfo(
                  context: context,
                  title: LocaleKeys.treeScreen_circumference.tr(),
                  value: widget.tree.circumference.toString(),
                  unit: LocaleKeys.treeScreen_centimeterUnit.tr()),
            ],
          ),
        ),
      ),
    );
  }
}
