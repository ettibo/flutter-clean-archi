import 'package:flutter/material.dart';

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:universal_platform/universal_platform.dart';

Widget platformListTile({
  required Key key,
  required Widget title,
  void Function()? onTap,
  Widget? subtitle,
  Widget? trailing,
  Widget? leading,
}) =>
    UniversalPlatform.isIOS
        ? CupertinoListTile(
            key: key,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            leading: leading,
            onTap: onTap)
        : ListTile(
            key: key,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            leading: leading,
            onTap: onTap);
