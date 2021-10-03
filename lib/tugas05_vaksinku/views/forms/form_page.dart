import 'package:flutter/material.dart';
import '../../models/form_screen_args.dart';
import '../../widgets/custom_appbar.dart';
import 'form_view.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // dapatkan data hasil pelemparan
    late final FormScreenArguments args;
    try {
      args = ModalRoute.of(context)!.settings.arguments as FormScreenArguments;
    } catch (_) {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: Image.asset(
          'assets/images/VaksinKu.png',
          height: 30,
          width: 150,
        ),
        leadingIcon: Icons.arrow_back,
        onPressLeadingIcon: () {
          Navigator.pop(context);
        },
      ),
      body: FormView(
        formType: args.type, // FormArgsType.add atau FormArgsType.detail
        participantId: args.participantId, // id peserta
      ),
    );
  }
}
