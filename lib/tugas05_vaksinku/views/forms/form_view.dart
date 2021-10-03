import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/form_screen_args.dart';
import '../../models/participant_model.dart';
import '../../providers/participant_provider.dart';
import '../../styles/typos.dart';
import '../../widgets/page_container.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_date_input.dart';
import '../../widgets/primary_radio_input.dart';
import '../../widgets/primary_text_input.dart';

class FormView extends StatefulWidget {
  const FormView({
    Key? key,
    required this.formType,
    this.participantId,
  }) : super(key: key);

  final FormArgsType formType; // FormArgsType.add atau FormArgsType.detail
  final int? participantId; // id peserta
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  // data peserta untuk ditampilkan dalam form
  late Participant _participant;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // dicari data peserta berdasarkan idnya
    // kalau tidak ada id dilemparkan ke page ini, maka _participant = Participant() / semua property null
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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              // tampilan teks bergantung pada formType
              (widget.formType == FormArgsType.add)
                  ? "Tambah Pendaftar"
                  : "Edit Pendaftar",
              style: typosTextBold(type: TyposType.large),
            ),
            const SizedBox(
              height: 20,
            ),

            // widget PrimaryTextInput dari folder /widgets
            PrimaryTextInput(
              label: "NIK",
              initialValue: _participant.nik,
              // inputan hanya berupa angka
              numberInput: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              valueSetter: (val) {
                // set nik pada objek _participant dengan isian dalam inputan
                _participant.nik = val;
              },
            ),

            // widget PrimaryTextInput dari folder /widgets
            PrimaryTextInput(
              label: "Nama Lengkap",
              labelText: "Masukkan nama lengkap sesuai KTP...",
              initialValue: _participant.name,
              valueSetter: (val) {
                // set name pada objek _participant dengan isian dalam inputan
                _participant.name = val;
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // widget RadioInputSection dari folder /widgets/primary_radio_input.dart
            RadioInputSection(
              label: "Jenis Kelamin",
              groupValue: _participant.gender,
              // value input dan bentuk label yang menyertainya
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
              // set gender pada objek _participant dengan isian dalam inputan
              valueSetter: (val) {
                _participant.gender = val;
              },
            ),

            // widget PrimaryDateInput dari folder /widgets
            PrimaryDateInput(
              label: "Tanggal Vaksinasi Ke-1",
              // tanggal awal
              initialDate: _participant.firstVaccineDate,
              // tanggal yang ditampilkan dalam teks
              dateText: _participant.showFirstVaccineDate,
              // set firstVaccineDate pada objek _participant dengan isian dalam inputan
              valueSetter: (val) {
                _participant.firstVaccineDate = val;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),

            // widget PrimaryDateInput dari folder /widgets
            PrimaryDateInput(
              label: "Tanggal Vaksinasi Ke-2",
              // tanggal awal
              initialDate: _participant.secondVaccineDate,
              // tanggal yang ditampilkan dalam teks
              dateText: _participant.showSecondVaccineDate,
              // set secondVaccineDate pada objek _participant dengan isian dalam inputan
              valueSetter: (val) {
                _participant.secondVaccineDate = val;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PrimaryButton(
                    buttonPadding: const EdgeInsets.symmetric(vertical: 20),
                    buttonText: (widget.formType == FormArgsType.add)
                        ? "Tambah"
                        : "Simpan",
                    // ketika tombol submit ditekan
                    buttonOnPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // kalau laman bertipe FormArgsType.add, lakukan proses penambahan peserta
                        if (widget.formType == FormArgsType.add) {
                          _participant.id = Random().nextInt(10001);
                          Provider.of<ParticipantProvider>(
                            context,
                            listen: false,
                          ).addParticipant(_participant);
                        } else if (widget.formType == FormArgsType.detail) {
                          // kalau laman bertipe FormArgsType.detail, lakukan proses pengeditan peserta
                          Provider.of<ParticipantProvider>(
                            context,
                            listen: false,
                          ).editParticipant(
                            _participant,
                          );
                        }
                        // tutup laman ini
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
