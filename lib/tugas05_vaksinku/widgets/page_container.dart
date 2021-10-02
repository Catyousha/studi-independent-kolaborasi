import 'package:flutter/material.dart';

// widget buatan dibuat sebagai class
// widget custom untuk membalut page di halaman agar kode lebih singkat dan reusable
class PageContainer extends StatelessWidget {
  final Widget child;

  const PageContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: child,
        ),
      ),
    );
  }
}
