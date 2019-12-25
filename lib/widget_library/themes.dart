import 'package:flutter/material.dart';

import '../utils/colors.dart';

enum StoryboardThemeKeys { LIGHT, DARK }

class StoryBoardThemes {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    accentColor: accentColor,
    buttonColor: Colors.amber,
    primaryColorDark: primaryDarkColor,
    primaryColor: primaryColor,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: getColor(0xffad1457),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: getColor(0xffad1457),
    accentColor: getColor(0xffe35183),
    buttonColor: getColor(0xff78002e),
    primaryColorDark: getColor(0xff78002e),
    primaryColor: getColor(0xffad1457),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );

  static ThemeData getThemeFromKey(StoryboardThemeKeys themeKey) {
    switch (themeKey) {
      case StoryboardThemeKeys.LIGHT:
        return lightTheme;
      case StoryboardThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
