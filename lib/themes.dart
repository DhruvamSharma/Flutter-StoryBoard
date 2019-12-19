import 'package:flutter/material.dart';

import 'utils/colors.dart';

enum StoryboardThemeKeys { LIGHT, DARK }

class StoryBoardThemes {
  
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    accentColor: accentColor,
    primaryColorDark: primaryDarkColor,
    primaryColor: primaryColor,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryDarkColor,
    accentColor: accentColor,
    primaryColorDark: primaryDarkColor,
    primaryColor: primaryColor,
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