import 'package:flutter/material.dart';

class NavigationObject {
  final String title;
  final IconData icon;
  final Widget screen;

  NavigationObject(
      {required this.title, required this.icon, required this.screen});
}
