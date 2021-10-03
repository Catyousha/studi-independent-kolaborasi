import 'package:flutter/material.dart';
import 'views/splashscreen/splash_screen.dart';
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
          '/': (context) => const SplashScreen(),
          '/dashboard': (context) => const DashboardPage(),
          '/tambah': (context) => const FormPage(),
          '/detail': (context) => const FormPage(),
        },
      ),
    );
  }
}
