import 'package:flutter/material.dart';
import '../../widgets/participant_tile/participant_tile.dart';
import '../../widgets/primary_button.dart';
import '../../styles/typos.dart';
import '../../widgets/page_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Selamat Siang!\nAmanda',
                style: typosTextBold(type: TyposType.large),
              ),
              Image.asset(
                'assets/images/icon_notif.png',
                height: 28,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/banner.png'),
          const SizedBox(
            height: 10,
          ),
          Image.asset('assets/images/bullet.png'),
          const SizedBox(
            height: 29,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Peserta Vaksinasi",
                style: typosTextBold(type: TyposType.regular),
              ),
              PrimaryButton(
                buttonText: "Tambah",
                buttonOnPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          const ParticipantTile(),
        ],
      ),
    );
  }
}
