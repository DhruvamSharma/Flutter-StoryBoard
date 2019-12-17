import 'package:flutter/material.dart';

class CommonColors {


  static Color lightColor = Colors.white;
  static Color darkColor = Colors.black;
  static Color grayColor = getColor(0xff959595);
  static Color darkGrayColor = getColor(0xff676767);
  static Color borderColor = getColor(0xffe0e0e0);
  static Color cardColor = getColor(0xfffafafa);
  static Color disabledColor = getColor(0xffededed);
  static Color disabledTextColor = getColor(0xffc7c7c7);

  static Color amberColor = getColor(0xfffe9a33);
  static Color primaryColor = getColor(0xFF3e51b5);
  static Color gradientStartBlue = getColor(0xff3e51b5);
  static Color gradientEndBlue = getColor(0xff3957ea);
  static Color purple = getColor(0xff8951d9);
}

Map<int, Color> _color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

MaterialColor getColor(int primary) {
  return MaterialColor(primary, _color);
}