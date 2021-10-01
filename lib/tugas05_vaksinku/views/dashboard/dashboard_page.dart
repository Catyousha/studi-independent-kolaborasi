import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/VaksinKu.png',
                      height: 30,
                      width: 150,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Selamat Siang!\nAmanda',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Image.asset(
                          'assets/images/icon_notif.png',
                          height: 28,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/images/banner.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset('assets/images/bullet.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
