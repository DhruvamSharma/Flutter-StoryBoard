import 'package:flutter/material.dart';

Map<int, Color> colorMap = {
  50: Color.fromRGBO(147, 205, 72, .1),
  100: Color.fromRGBO(147, 205, 72, .2),
  200: Color.fromRGBO(147, 205, 72, .3),
  300: Color.fromRGBO(147, 205, 72, .4),
  400: Color.fromRGBO(147, 205, 72, .5),
  500: Color.fromRGBO(147, 205, 72, .6),
  600: Color.fromRGBO(147, 205, 72, .7),
  700: Color.fromRGBO(147, 205, 72, .8),
  800: Color.fromRGBO(147, 205, 72, .9),
  900: Color.fromRGBO(147, 205, 72, 1),
};
// Green color code: 93cd48 and first two characters (FF) are alpha values (transparency)
MaterialColor customColor = MaterialColor(0xFF93cd48, colorMap);

MaterialColor primaryColor = getColor(0xff00003d);
MaterialColor primaryDarkColor = getColor(0xff00001a);
MaterialColor accentColor = getColor(0xff2f2a68);


MaterialColor getColor(int x) {
  return MaterialColor(x, colorMap);
}