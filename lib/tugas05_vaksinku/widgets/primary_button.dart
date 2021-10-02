import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

// widget buatan dibuat sebagai class
class PrimaryButton extends StatelessWidget {
  // parameter buatan sendiri agar lebih custom
  const PrimaryButton({
    Key? key,
    required this.buttonText,
    required this.buttonOnPressed,
    this.buttonPadding,
    this.textStyle,
    this.buttonColor = CustomColor.colorPriBase,
  }) : super(key: key);

  final String buttonText; // teks dalam button
  final VoidCallback buttonOnPressed; // fungsi ketika tombol ditekan
  final EdgeInsetsGeometry? buttonPadding; // padding button
  final TextStyle? textStyle; // style teks dalam button
  final Color buttonColor; // warna button

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //agar bentuk button ada borderradiusnya
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        primary: buttonColor, // data dari parameter buttonColor
        
        // data dari parameter buttonPadding
        // kalau datanya null, pakai EdgeInsets default di widget ini
        padding: buttonPadding ??
            const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 32.0,
            ),
      ),
      child: Text(
        buttonText,
        // data dari parameter textStyle
        // kalau datanya null, pakai style yang diambil dari font custom di folder /styles
        style: textStyle ??
            typosTextRegular(
              type: TyposType.small,
              color: CustomColor.colorSkyWhite,
            ),
      ),
      // data dari parameter buttonOnPressed
      onPressed: buttonOnPressed,
    );
  }
}
