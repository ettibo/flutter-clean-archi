import 'package:flutter/material.dart';

import 'package:globo_fitness/ressources/theme/theme_colors.dart';

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
    MaterialColor(ThemeColors.green.value, mapPrimarySwatchColor);

ThemeData greenDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: greenDarkPrimarySwatch,
  primaryColor: ThemeColors.green,
  backgroundColor: ThemeColors.backgroundDarkMode,
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.white,
  bottomAppBarColor: ThemeColors.green,
  indicatorColor: ThemeColors.green,
  secondaryHeaderColor: Colors.white,
  dividerColor: Colors.grey,
  textTheme: textTheme,
);

TextTheme textTheme = const TextTheme(
  titleMedium: TextStyle(
    color: Colors.white,
  ),
);
