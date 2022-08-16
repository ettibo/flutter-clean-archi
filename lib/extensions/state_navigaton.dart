import 'package:flutter/material.dart';

extension StateNavigation on State {
  void navigateTo(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }
}
