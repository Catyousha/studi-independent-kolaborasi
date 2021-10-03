import 'dart:async';
import 'package:flutter/material.dart';
import '../../styles/typos.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/dashboard');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/VaksinKu.png',
                      scale: 1.5,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Aplikasi Pendataan Pendaftar Vaksinasi\nPuskesmas Teyvat',
                    textAlign: TextAlign.center,
                    style: typosTextRegular(type: TyposType.small),
                  ),
                ],
              ),
            ),
            const Text(
              '© PT. Mencari Cinta Sejati',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
