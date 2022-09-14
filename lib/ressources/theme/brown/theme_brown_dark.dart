import 'package:flutter/material.dart';

import 'package:globo_fitness/ressources/theme/theme_colors.dart';

Map<int, Color> mapPrimarySwatchColor = const {
  50: Color.fromRGBO(40, 26, 13, .1),
  100: Color.fromRGBO(40, 26, 13, .2),
  200: Color.fromRGBO(40, 26, 13, .3),
  300: Color.fromRGBO(40, 26, 13, .4),
  400: Color.fromRGBO(40, 26, 13, .5),
  500: Color.fromRGBO(40, 26, 13, .6),
  600: Color.fromRGBO(40, 26, 13, .7),
  700: Color.fromRGBO(40, 26, 13, .8),
  800: Color.fromRGBO(40, 26, 13, .9),
  900: Color.fromRGBO(40, 26, 13, 1),
};

MaterialColor brownDarkPrimarySwatch =
    MaterialColor(ThemeColors.darkBrown.value, mapPrimarySwatchColor);

ThemeData brownDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: brownDarkPrimarySwatch,
  primaryColor: ThemeColors.darkBrown,
  backgroundColor: ThemeColors.backgroundDarkMode,
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.white,
  bottomAppBarColor: ThemeColors.darkBrown,
  indicatorColor: ThemeColors.darkBrown,
  secondaryHeaderColor: Colors.white,
  dividerColor: Colors.grey,
  textTheme: textTheme,
);

TextTheme textTheme = const TextTheme(
  titleMedium: TextStyle(
    color: Colors.white,
  ),
);
