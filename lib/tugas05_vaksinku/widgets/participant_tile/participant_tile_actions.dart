import 'package:flutter/material.dart';
import '../../models/form_screen_args.dart';
import '../../providers/participant_provider.dart';
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

  // tampilan alert dialog, ketika ditekan tombol hapus
  Widget _showRemoveDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Hapus Peserta'),
      content: const Text('Ingin menghapus peserta?'),
      actions: [
        PrimaryButton(
          buttonText: "Batal",
          buttonOnPressed: () {
            Navigator.pop(context);
          },
        ),
        PrimaryButton(
          buttonText: "Hapus",
          buttonColor: CustomColor.colorRedBase,
          buttonOnPressed: () {
            // hapus peserta berdasarkan idnya menggunakan method dari class ParticipantProvider
            Provider.of<ParticipantProvider>(
              context,
              listen: false,
            ).removeParticipant(participantId);
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // menggunakan widget PrimaryButton dalam folder /widgets
        Expanded(
          child: PrimaryButton(
            buttonText: "Detail",
            buttonOnPressed: () {
              // navigasi ke laman /detail
              // pelemparan data dilakukan melalui arguments dengan class FormScreenArguments
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
        ),
        const SizedBox(width: 13),

        // menggunakan widget PrimaryButton dalam folder /widgets
        Expanded(
          child: PrimaryButton(
            buttonText: "Hapus",
            buttonOnPressed: () {
              // tampilkan widget AlertDialog dari fungsi _showRemoveDialog()
              showDialog<void>(
                context: context,
                builder: (context) => _showRemoveDialog(context),
              );
            },
            buttonColor: CustomColor.colorRedBase,
          ),
        ),
      ],
    );
  }
}
