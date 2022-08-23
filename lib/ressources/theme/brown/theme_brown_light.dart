import 'package:flutter/material.dart';

Color lightBrown = const Color(0xffC4A484);

Map<int, Color> mapPrimarySwatchColor = const {
  50: Color.fromRGBO(196, 164, 132, .1),
  100: Color.fromRGBO(196, 164, 132, .2),
  200: Color.fromRGBO(196, 164, 132, .3),
  300: Color.fromRGBO(196, 164, 132, .4),
  400: Color.fromRGBO(196, 164, 132, .5),
  500: Color.fromRGBO(196, 164, 132, .6),
  600: Color.fromRGBO(196, 164, 132, .7),
  700: Color.fromRGBO(196, 164, 132, .8),
  800: Color.fromRGBO(196, 164, 132, .9),
  900: Color.fromRGBO(196, 164, 132, 1),
};

MaterialColor brownLightPrimarySwatch =
    MaterialColor(lightBrown.value, mapPrimarySwatchColor);

ThemeData brownLightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: brownLightPrimarySwatch,
  primaryColor: lightBrown,
  backgroundColor: Colors.white,
  primaryColorDark: lightBrown,
  primaryColorLight: Colors.black,
  bottomAppBarColor: lightBrown,
  indicatorColor: lightBrown,
);
