import 'package:flutter/material.dart';

Color lightGreen = const Color(0xff83f28f);

Map<int, Color> mapPrimarySwatchColor = const {
  50: Color.fromRGBO(131, 242, 143, .1),
  100: Color.fromRGBO(131, 242, 143, .2),
  200: Color.fromRGBO(131, 242, 143, .3),
  300: Color.fromRGBO(131, 242, 143, .4),
  400: Color.fromRGBO(131, 242, 143, .5),
  500: Color.fromRGBO(131, 242, 143, .6),
  600: Color.fromRGBO(131, 242, 143, .7),
  700: Color.fromRGBO(131, 242, 143, .8),
  800: Color.fromRGBO(131, 242, 143, .9),
  900: Color.fromRGBO(131, 242, 143, 1),
};

MaterialColor greenLightPrimarySwatch =
    MaterialColor(lightGreen.value, mapPrimarySwatchColor);

ThemeData greenLightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: greenLightPrimarySwatch,
  primaryColor: lightGreen,
  backgroundColor: Colors.white,
  primaryColorDark: lightGreen,
  primaryColorLight: Colors.black,
  bottomAppBarColor: lightGreen,
  indicatorColor: lightGreen,
);
