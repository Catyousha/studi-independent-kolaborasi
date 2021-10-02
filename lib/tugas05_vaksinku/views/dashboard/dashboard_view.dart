import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/models/form_screen_args.dart';
import 'package:provider/provider.dart';

import '../../models/participant_model.dart';
import '../../providers/participant_provider.dart';
import '../../styles/typos.dart';
import '../../widgets/page_container.dart';
import '../../widgets/participant_tile/participant_tile.dart';
import '../../widgets/primary_button.dart';

// widget buatan dibuat sebagai class
// sebagai penampil tampilan dashboard
class DashboardView extends StatelessWidget {
  const DashboardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Participant> _participantList = Provider.of<ParticipantProvider>(
      context,
      listen: false,
    ).list;
    // widget PageContainer dari folder /widgets
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
                // menggunakan text style custom dari folder /styles file typos.dart
                style: typosTextBold(type: TyposType.regular),
              ),
              // menggunakan widget PrimaryButton dari folder /widgets
              PrimaryButton(
                buttonText: "Tambah",
                buttonOnPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/tambah',
                    arguments: FormScreenArguments(
                      type: FormArgsType.add,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // menggunakan widget ParticipantTile dari folder /widgets
          ...List.generate(_participantList.length, (index) {
            return ParticipantTile(
              id: _participantList[index].id!,
              name: _participantList[index].name!,
              nik: _participantList[index].nik!,
            );
          })
        ],
      ),
    );
  }
}
