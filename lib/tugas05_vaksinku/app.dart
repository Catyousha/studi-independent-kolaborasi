import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/views/dashboard/dashboard_page.dart';

import 'views/forms/form_page.dart';

class VaksinkuApp extends StatelessWidget {
  const VaksinkuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VaksinKu",
      debugShowCheckedModeBanner: false,

      // daftar alamat dan widget halaman
      routes: {
        '/': (context) => const DashboardPage(),
        '/tambah': (context) => const FormPage(),
        '/edit': (context) => const FormPage(),
      },
    );
  }
}
