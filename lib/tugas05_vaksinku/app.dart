import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/views/splasscreen/splash_screen.dart';
import 'providers/participant_provider.dart';
import 'views/dashboard/dashboard_page.dart';
import 'package:provider/provider.dart';

import 'views/forms/form_page.dart';

class VaksinkuApp extends StatelessWidget {
  const VaksinkuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ParticipantProvider>(
      create: (_) => ParticipantProvider(),
      child: MaterialApp(
        title: "VaksinKu",

        debugShowCheckedModeBanner: false,
        // daftar alamat dan widget halaman
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/': (context) => const DashboardPage(),
          '/tambah': (context) => const FormPage(),
          '/detail': (context) => const FormPage(),
        },
      ),
    );
  }
}
