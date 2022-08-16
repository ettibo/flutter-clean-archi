import 'package:flutter/material.dart';

extension StateNavigation on State {
  void navigateTo(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }
}
