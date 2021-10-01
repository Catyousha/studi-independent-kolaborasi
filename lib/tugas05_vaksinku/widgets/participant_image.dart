import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/styles/colors.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/styles/shadows.dart';

class ParticipantImage extends StatelessWidget {
  const ParticipantImage({
    Key? key,
    this.image,
  }) : super(key: key);

  final Image? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: CustomColor.colorSkyWhite,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: image ??
            Image.asset(
              'assets/images/anonymous-user.png',
              fit: BoxFit.fill,
            ),
      ),
    );
  }
}
