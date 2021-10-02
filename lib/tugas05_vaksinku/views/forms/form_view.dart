import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/participant_provider.dart';
import 'package:provider/provider.dart';
import '../../models/form_screen_args.dart';
import '../../models/participant_model.dart';

import '../../styles/typos.dart';
import '../../widgets/page_container.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_radio_input.dart';
import '../../widgets/primary_text_input.dart';

class FormView extends StatefulWidget {
  const FormView({
    Key? key,
    required this.formType,
    this.participantId,
  }) : super(key: key);

  final FormArgsType formType;
  final int? participantId;
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  late Participant _participant;

  @override
  void initState() {
    _participant = Provider.of<ParticipantProvider>(
      context,
      listen: false,
    ).getParticipantById(widget.participantId ?? -1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // widget PageContainer dari folder /widgets
    return PageContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            (widget.formType == FormArgsType.add)
                ? "Tambah Pendaftar"
                : "Edit Pendaftar",
            style: typosTextBold(type: TyposType.large),
          ),
          const SizedBox(
            height: 20,
          ),
          PrimaryTextInput(
            label: "NIK",
            initialValue: _participant.nik,
            valueSetter: (val) {
              _participant.nik = val;
            },
          ),
          PrimaryTextInput(
            label: "Nama Lengkap",
            labelText: "Masukkan nama lengkap sesuai KTP...",
            initialValue: _participant.name,
            valueSetter: (val) {
              _participant.name = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          RadioInputSection(
            label: "Jenis Kelamin",
            groupValue: _participant.gender,
            radioChoices: <ParticipantGender, Widget>{
              ParticipantGender.male: Text(
                "Pria",
                style: typosTextRegular(type: TyposType.small),
              ),
              ParticipantGender.female: Text(
                "Wanita",
                style: typosTextRegular(type: TyposType.small),
              ),
            },
            valueSetter: (val) {
              _participant.gender = val;
            },
          ),
          Row(
            children: [
              Text(
                'Tanggal Vaksinasi Ke-1',
                style: typosTextBold(type: TyposType.large),
              ),
            ],
          ),
          TextField(
            cursorColor: Theme.of(context).cursorColor,
            decoration: InputDecoration(
              hintText: "DD/MM/YYYY",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Tanggal Vaksinasi Ke-2',
                style: typosTextBold(type: TyposType.large),
              ),
            ],
          ),
          TextField(
            cursorColor: Theme.of(context).cursorColor,
            decoration: InputDecoration(
              hintText: "DD/MM/YYYY",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButton(
            buttonText: "Tambah",
            buttonOnPressed: () {
              Navigator.pushNamed(context, '/tambah');
            },
          ),
        ],
      ),
    );
  }
}
