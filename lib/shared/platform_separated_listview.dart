import 'package:flutter/material.dart';

import 'package:universal_platform/universal_platform.dart';

ListView platformSeparatedListView(
        {required int itemCount,
        required Widget Function(BuildContext, int) itemBuilder,
        required Widget Function(BuildContext, int) separatorBuilder,
        bool shrinkWrap = true}) =>
    UniversalPlatform.isIOS
        ? ListView.builder(
            // Will use CupertinoListTile that already have a separator
            itemBuilder: itemBuilder,
            itemCount: itemCount,
            shrinkWrap: shrinkWrap)
        : ListView.separated(
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: itemCount,
            shrinkWrap: shrinkWrap,
          );
