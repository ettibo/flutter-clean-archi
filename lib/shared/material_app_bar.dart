import 'package:flutter/material.dart';

AppBar materialAppBar(
        {Widget? leading,
        String? title,
        List<Widget>? trailingWidgets,
        bool centerTitle = true,
        Color? backgroundColor}) =>
    AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      leading: leading,
      title: Text(title ?? ''),
      actions: trailingWidgets,
    );
