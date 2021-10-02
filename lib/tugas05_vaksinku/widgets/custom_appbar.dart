import 'package:flutter/material.dart';
import '../styles/colors.dart';

// widget buatan dibuat sebagai class
// khusus untuk appbar, implements PreferredSizeWidget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // parameter buatan sendiri agar lebih custom
  final Color? backgroundColor = Colors.red;
  final Widget? title;
  final IconData leadingIcon;
  final VoidCallback onPressLeadingIcon;

  const CustomAppBar({
    Key? key,
    this.title,
    required this.leadingIcon,
    required this.onPressLeadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: title, //data dari parameter title
      ),
      leading: IconButton(
        onPressed: onPressLeadingIcon, //data dari parameter onPressLeadingIcon
        icon: Icon(leadingIcon), //data dari parameter leadingIcon
        color: CustomColor.colorInkDarkest, //color custom dari colors.dart di folder /styles
      ),
      backgroundColor: CustomColor.colorSkyWhite, //color custom dari colors.dart di folder /styles
      elevation: 2,
    );
  }

  // kalau ada implementasi PreferredSizeWidget, mesti ada ginian, referensi dari stack overflow
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}