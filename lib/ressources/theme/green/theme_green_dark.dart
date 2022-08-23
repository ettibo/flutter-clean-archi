import 'package:flutter/material.dart';

Color darkGreen = const Color(0xff65793C);

Map<int, Color> mapPrimarySwatchColor = const {
  50: Color.fromRGBO(101, 121, 60, .1),
  100: Color.fromRGBO(101, 121, 60, .2),
  200: Color.fromRGBO(101, 121, 60, .3),
  300: Color.fromRGBO(101, 121, 60, .4),
  400: Color.fromRGBO(101, 121, 60, .5),
  500: Color.fromRGBO(101, 121, 60, .6),
  600: Color.fromRGBO(101, 121, 60, .7),
  700: Color.fromRGBO(101, 121, 60, .8),
  800: Color.fromRGBO(101, 121, 60, .9),
  900: Color.fromRGBO(101, 121, 60, 1),
};

MaterialColor greenDarkPrimarySwatch =
    MaterialColor(darkGreen.value, mapPrimarySwatchColor);

ThemeData greenDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: greenDarkPrimarySwatch,
  primaryColor: darkGreen,
  backgroundColor: const Color(0xff333333),
  primaryColorDark: darkGreen,
  primaryColorLight: Colors.black,
  bottomAppBarColor: darkGreen,
  indicatorColor: darkGreen,
);
