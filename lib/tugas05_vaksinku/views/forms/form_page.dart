import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/widgets/custom_appbar.dart';
import 'form_view.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Image.asset(
          'assets/images/VaksinKu.png',
          height: 30,
          width: 150,
        ),
        leadingIcon: Icons.arrow_back,
        onPressLeadingIcon: () {},
      ),
      body: FormView(),
    );
  }
}
