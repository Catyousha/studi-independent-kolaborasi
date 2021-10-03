import 'package:flutter/material.dart';
import '../../models/form_screen_args.dart';
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
    // mendapatkan daftar peserta dalam 'database' list dari class ParticipantProvider
    List<Participant> _participantList =
        Provider.of<ParticipantProvider>(context).list;

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
              const SizedBox(width: 16),
              // menggunakan widget PrimaryButton dari folder /widgets
              PrimaryButton(
                buttonPadding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                buttonText: "Tambah",
                buttonOnPressed: () {
                  // navigasi ke laman /tambah
                  // pelemparan data dilakukan melalui arguments dengan class FormScreenArguments
                  Navigator.pushNamed(
                    context,
                    '/tambah',
                    arguments: FormScreenArguments(
                      // menandakan laman form tersebut bertipe penambahan peserta
                      type: FormArgsType.add,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // kalau database kosong, tampilkan tulisan "Tidak ada peserta terdaftar."
          if (_participantList.isEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "Tidak ada peserta terdaftar.",
                  style: typosTextBold(type: TyposType.regular),
                ),
              ),
            ),

          // meng-generate list berdasarkan isi database kemudian dicetak dalam widget ParticipantTile
          // menggunakan widget ParticipantTile dari folder /widgets
          ...List.generate(_participantList.length, (index) {
            return ParticipantTile(
              id: _participantList[index].id!, // id peserta
              name: _participantList[index].name!, // nama peserta
              nik: _participantList[index].nik!, // nik peserta
            );
          }),
        ],
      ),
    );
  }
}
