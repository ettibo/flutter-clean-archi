import 'package:flutter/material.dart';

AppBar appBar(
        {Widget? leading,
        Widget? title,
        bool centerTitle = true,
        Color? backgroundColor}) =>
    AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      leading: leading,
      title: title,
    );
