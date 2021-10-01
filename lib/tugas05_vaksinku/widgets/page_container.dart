import 'package:flutter/material.dart';

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
