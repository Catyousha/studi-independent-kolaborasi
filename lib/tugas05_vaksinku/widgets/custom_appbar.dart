import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
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
        child: title,
      ),
      leading: IconButton(
        onPressed: onPressLeadingIcon,
        icon: Icon(leadingIcon),
        color: CustomColor.colorInkDarkest,
      ),
      backgroundColor: CustomColor.colorSkyWhite,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}