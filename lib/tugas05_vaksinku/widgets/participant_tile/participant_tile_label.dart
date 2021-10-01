import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/styles/typos.dart';

class ParticipantTileLabel extends StatelessWidget {
  const ParticipantTileLabel({
    Key? key,
    required this.name,
    required this.nik,
  }) : super(key: key);

  final String name;
  final String nik;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: typosTextBold(type: TyposType.small),
        ),
        const SizedBox(height: 3.0),
        Text(
          nik,
          style: typosTextRegular(type: TyposType.tiny),
        ),
      ],
    );
  }
}
