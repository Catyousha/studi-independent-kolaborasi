import 'package:flutter/material.dart';
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
        children: [
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
          
        ],
      ),
    );
  }
}