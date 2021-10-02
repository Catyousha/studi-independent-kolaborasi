import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/models/form_screen_args.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/providers/participant_provider.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../primary_button.dart';

// widget buatan dibuat sebagai class
// sebagai penampil dua tombol (detail dan hapus) dalam tile peserta
class ParticipantTileActions extends StatelessWidget {
  const ParticipantTileActions({
    Key? key,
    required this.participantId,
  }) : super(key: key);

  final int participantId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // menggunakan widget PrimaryButton dalam folder /widgets
        PrimaryButton(
          buttonText: "Detail",
          buttonOnPressed: () {
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: FormScreenArguments(
                type: FormArgsType.detail,
                participantId: participantId,
              ),
            );
          },
        ),
        const SizedBox(width: 13),

        // menggunakan widget PrimaryButton dalam folder /widgets
        PrimaryButton(
          buttonText: "Hapus",
          buttonOnPressed: () {},
          buttonColor: CustomColor.colorRedBase,
        ),
      ],
    );
  }
}
