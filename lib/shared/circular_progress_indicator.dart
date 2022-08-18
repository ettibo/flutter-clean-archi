import 'package:flutter/material.dart';

Widget getActivityIndicator({BuildContext? context}) => Center(
      child: CircularProgressIndicator(
          color: context != null
              ? Theme.of(context).indicatorColor
              : Colors.black),
    );
