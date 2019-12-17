import 'package:flutter/material.dart';
import 'package:storyboard/widget_library/common_utitlities/common_colors.dart';
import 'package:storyboard/widget_library/common_utitlities/common_text_styles.dart';

class GradientButtonBlue extends StatelessWidget {
  final String buttonText;
  final Function onTapGradientButton;
  final double height;
  final double width;
  final double fontSize;
  GradientButtonBlue({
    @required this.buttonText,
    @required this.onTapGradientButton,
    this.height = 64,
    @required this.width,
    this.fontSize = 14,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        gradient: LinearGradient(colors: [
          CommonColors.gradientStartBlue,
          CommonColors.gradientEndBlue,
        ]),
      ),
      child: MaterialButton(
        onPressed: onTapGradientButton,
        child: Text(
          buttonText,
          style: CommonTextStyles.getBoldTextStyleLight(context)
              .copyWith(fontSize: fontSize),
        ),
      ),
    );
  }
}
