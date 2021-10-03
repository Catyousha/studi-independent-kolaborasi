import 'package:flutter/material.dart';
import 'participant_tile_actions.dart';
import '../../styles/colors.dart';
import '../../styles/shadows.dart';
import 'participant_image.dart';
import 'participant_tile_label.dart';

// widget buatan dibuat sebagai class
// sebagai penampil tile peserta
class ParticipantTile extends StatelessWidget {
  const ParticipantTile({
    Key? key,
    required this.id,
    required this.name,
    required this.nik,
  }) : super(key: key);

  // menerima parameter id, nama, dan nik peserta
  final int id;
  final String name;
  final String nik;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 18.0,
      ),
      decoration: BoxDecoration(
        //color custom dari colors.dart di folder /styles
        color: CustomColor.colorSkyWhite,

        //shadow custom dari shadows.dart di folder /styles
        boxShadow: CustomShadow.shadowSmall,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: CustomColor.colorPriLightest,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // widget ParticipantImage dari folder /widgets/participant_tile
          const ParticipantImage(),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // widget ParticipantTileLabel dari folder /widgets/participant_tile
                // melemparkan nama dan nik peserta untuk ditampilkan
                ParticipantTileLabel(
                  name: name,
                  nik: nik,
                ),
                const SizedBox(height: 8),

                // widget ParticipantTileActions dari folder /widgets/participant_tile
                // melemparkan id peserta untuk digunakan
                ParticipantTileActions(
                  participantId: id,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
