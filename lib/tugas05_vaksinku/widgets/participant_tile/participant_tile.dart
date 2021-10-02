import 'package:flutter/material.dart';
import 'participant_tile_actions.dart';
import '../../styles/colors.dart';
import '../../styles/shadows.dart';
import 'participant_image.dart';
import 'participant_tile_label.dart';

// widget buatan dibuat sebagai class
// sebagai penampil tile peserta
class ParticipantTile extends StatelessWidget {
  const ParticipantTile({Key? key}) : super(key: key);

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
              children: const <Widget>[
                // widget ParticipantTileLabel dari folder /widgets/participant_tile
                ParticipantTileLabel(
                  name: "Abdul Hanif",
                  nik: "3204271810988903",
                ),
                SizedBox(height: 8),
                
                // widget ParticipantTileActions dari folder /widgets/participant_tile
                ParticipantTileActions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
