import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../primary_button.dart';

// widget buatan dibuat sebagai class
// sebagai penampil dua tombol (detail dan hapus) dalam tile peserta
class ParticipantTileActions extends StatelessWidget {
  const ParticipantTileActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // menggunakan widget PrimaryButton dalam folder /widgets
        PrimaryButton(
          buttonText: "Detail",
          buttonOnPressed: () {},
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
