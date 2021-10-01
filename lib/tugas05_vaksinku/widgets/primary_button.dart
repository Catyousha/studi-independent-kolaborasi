import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonText,
    required this.buttonOnPressed,
    this.buttonPadding,
    this.textStyle,
    this.buttonColor = CustomColor.colorPriBase,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback buttonOnPressed;
  final EdgeInsetsGeometry? buttonPadding;
  final TextStyle? textStyle;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        primary: buttonColor,
        padding: buttonPadding ??
            const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 32.0,
            ),
      ),
      child: Text(
        buttonText,
        style: textStyle ??
            typosTextRegular(
              type: TyposType.small,
              color: CustomColor.colorSkyWhite,
            ),
      ),
      onPressed: buttonOnPressed,
    );
  }
}
