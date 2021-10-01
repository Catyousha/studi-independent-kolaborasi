import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/views/dashboard/dashboard_page.dart';

class VaksinkuApp extends StatelessWidget {
  const VaksinkuApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VaksinKu",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const DashboardPage(),
      },
    );
  }
}