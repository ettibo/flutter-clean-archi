import 'package:flutter/material.dart';

import 'package:globo_fitness/ressources/colors.dart';

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
    MaterialColor(ThemeColors.green.value, mapPrimarySwatchColor);

ThemeData greenLightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: greenLightPrimarySwatch,
    primaryColor: ThemeColors.green,
    backgroundColor: Colors.white,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    bottomAppBarColor: ThemeColors.green,
    indicatorColor: ThemeColors.green,
    secondaryHeaderColor: Colors.black,
    dividerColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme);

TextTheme textTheme = const TextTheme(
  titleMedium: TextStyle(
    color: Colors.black,
  ),
);
