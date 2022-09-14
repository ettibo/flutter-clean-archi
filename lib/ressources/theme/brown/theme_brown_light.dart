import 'package:flutter/material.dart';

import 'package:globo_fitness/ressources/colors.dart';

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
    MaterialColor(ThemeColors.lightBrown.value, mapPrimarySwatchColor);

ThemeData brownLightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: brownLightPrimarySwatch,
    primaryColor: ThemeColors.lightBrown,
    backgroundColor: Colors.white,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    bottomAppBarColor: ThemeColors.lightBrown,
    indicatorColor: ThemeColors.lightBrown,
    secondaryHeaderColor: Colors.black,
    dividerColor: Colors.grey,
    textTheme: textTheme);

TextTheme textTheme = const TextTheme(
  titleMedium: TextStyle(
    color: Colors.black,
  ),
);
