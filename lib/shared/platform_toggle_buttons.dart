import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";

import 'package:universal_platform/universal_platform.dart';

Widget platformToggleButtons<T>({
  required BuildContext context,
  required Map<T, Widget> items,
  required Function(int)? onPressedMaterial,
  required List<bool> isSelectedMaterial,
  required Function(dynamic) onPressedCupertino,
  required T currentSelectedItem,
  Color? selectedColor,
  BorderRadius? borderRadius,
}) {
  if (UniversalPlatform.isIOS) {
    return _cupertinoToggleButtons(
      context: context,
      onValueChanged: onPressedCupertino,
      groupValue: currentSelectedItem,
      thumbColor: selectedColor,
      children: items,
    );
  } else {
    List<Widget> listItems = items.values.toList();
    return _materialToggleButtons(
      isSelected: isSelectedMaterial,
      isSelectedColor: Theme.of(context).primaryColor,
      onPressed: onPressedMaterial,
      items: listItems,
      borderRadius: borderRadius,
    );
  }
}

ToggleButtons _materialToggleButtons({
  required List<Widget> items,
  required List<bool> isSelected,
  required Function(int)? onPressed,
  Color? isSelectedColor,
  BorderRadius? borderRadius,
}) =>
    ToggleButtons(
      onPressed: onPressed,
      isSelected: isSelected,
      borderRadius: borderRadius,
      fillColor: isSelectedColor,
      children: items,
    );

CupertinoSlidingSegmentedControl _cupertinoToggleButtons<T>(
        {required BuildContext context,
        required Map<T, Widget> children,
        required Function(dynamic) onValueChanged,
        Color? backgroundColor,
        Color? thumbColor,
        T? groupValue}) =>
    CupertinoSlidingSegmentedControl(
      children: children,
      thumbColor: thumbColor ?? Theme.of(context).primaryColor,
      onValueChanged: onValueChanged,
      groupValue: groupValue,
    );
