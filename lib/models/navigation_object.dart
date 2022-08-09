import 'package:flutter/material.dart';

class NavigationObject {
  final String title;
  final String route;
  final IconData icon;
  final Widget screen;

  NavigationObject(
      {required this.title,
      required this.route,
      required this.icon,
      required this.screen});
}
