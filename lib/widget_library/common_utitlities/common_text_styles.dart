import 'package:flutter/material.dart';
import 'package:storyboard/widget_library/common_utitlities/common_colors.dart';

/// Text styles are mainly 4:
/// Roboto-black fontWeight - w900,
/// Roboto-bold - fontWeight - w700,
/// Roboto-medium - fontWeight - w500,
/// Roboto-regular - fontWeight - w300,
class CommonTextStyles {

  static double _blackFontSize = 18;
  static double _boldFontSize = 16;
  static double _mediumFontSize = 14;
  static double _regularFontSize = 12;

  /// Black TextStyle
  static TextStyle getBlackTextStyleLight(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.lightColor,
      fontSize: _blackFontSize,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle getBlackTextStyleDark(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.darkColor,
      fontSize: _blackFontSize,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle getBlackTextStyleGray(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.grayColor,
      fontSize: _blackFontSize,
      fontWeight: FontWeight.w900,
    );
  }

  /// Bold TextStyle
  static TextStyle getBoldTextStyleLight(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.lightColor,
      fontSize: _boldFontSize,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle getBoldTextStyleDark(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.darkColor,
      fontSize: _boldFontSize,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle getBoldTextStyleGray(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.grayColor,
      fontSize: _boldFontSize,
      fontWeight: FontWeight.w700,
    );
  }

  /// Medium TextStyle
  static TextStyle getMediumTextStyleLight(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.lightColor,
      fontSize: _mediumFontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle getMediumTextStyleDark(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.darkColor,
      fontSize: _mediumFontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle getMediumTextStyleGray(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.grayColor,
      fontSize: _mediumFontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle getMediumTextStyleYellow(BuildContext context) {
    return Theme.of(context).textTheme.subtitle.copyWith(
      color: CommonColors.amberColor,
      fontSize: _mediumFontSize,
      fontWeight: FontWeight.w700,
    );
  }

  /// Regular TextStyle
  static TextStyle getRegularTextStyleLight(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.lightColor,
      fontSize: _regularFontSize,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle getRegularTextStyleDark(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.darkColor,
      fontSize: _regularFontSize,
    );
  }

  static TextStyle getRegularTextStyleGray(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
      color: CommonColors.grayColor,
      fontSize: _regularFontSize,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle getSubTitleTextStyleDark(BuildContext context) {
    return Theme.of(context).textTheme.subtitle.copyWith(
      color: CommonColors.darkColor,
    );
  }

  static TextStyle getSubTitleTextStyleGray(BuildContext context) {
    return Theme.of(context).textTheme.subtitle.copyWith(
      color: CommonColors.grayColor,
    );
  }
}