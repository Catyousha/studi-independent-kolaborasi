import 'package:flutter/material.dart';
import '../../styles/typos.dart';

// widget buatan dibuat sebagai class
// sebagai penampil nama dan nik peserta
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
          // menggunakan text style custom dari folder /styles file typos.dart
          style: typosTextBold(type: TyposType.small),
        ),
        const SizedBox(height: 3.0),
        Text(
          nik,
          // menggunakan text style custom dari folder /styles file typos.dart
          style: typosTextRegular(type: TyposType.tiny),
        ),
      ],
    );
  }
}
