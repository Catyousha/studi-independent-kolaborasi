import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/styles/typos.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/DashboardPage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/images/VaksinKu.png',
              scale: 1.5,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'Aplikasi Pendataan Pendaftar Vaksinasi\nPuskesmas Teyvat',
            style: typosTextRegular(type: TyposType.small),
          ),
          SizedBox(
            height: 200.0,
          ),
          Text(
            '© PT. Mencari Cinta Sejati',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
