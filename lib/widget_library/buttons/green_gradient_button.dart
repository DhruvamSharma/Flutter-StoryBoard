import 'package:flutter/material.dart';
import 'package:storyboard/widget_library/common_utitlities/common_colors.dart';

class GradientButtonGreen extends StatelessWidget {
  final String buttonText;
  final TextStyle buttonTextStyle;
  final bool isDisabled;
  final Function onTap;
  final double height;
  final double width;

  GradientButtonGreen({
    @required this.buttonText,
    @required this.buttonTextStyle,
    this.isDisabled = false,
    @required this.onTap,
    this.width,
    this.height = 64,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          buttonText,
          style: buttonTextStyle,
        ),
      ),
      decoration: isDisabled
          ? BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: CommonColors.disabledColor,
      )
          : BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        gradient: LinearGradient(colors: [
          getColor(0xff25d676),
          getColor(0xff208e54),
        ]),
      ),
    );
  }
}
