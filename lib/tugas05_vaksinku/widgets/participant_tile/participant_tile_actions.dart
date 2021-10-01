import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../primary_button.dart';

class ParticipantTileActions extends StatelessWidget {
  const ParticipantTileActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PrimaryButton(
          buttonText: "Detail",
          buttonOnPressed: () {},
        ),
        const SizedBox(width: 13),
        PrimaryButton(
          buttonText: "Hapus",
          buttonOnPressed: () {},
          buttonColor: CustomColor.colorRedBase,
        ),
      ],
    );
  }
}
