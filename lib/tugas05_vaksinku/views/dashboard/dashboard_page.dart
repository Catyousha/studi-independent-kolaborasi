import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard_view.dart';
import '../../widgets/custom_appbar.dart';

// sebagai widget halaman
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // CustomAppBar: widget buatan yang dibuat dalam folder /widgets
      appBar: CustomAppBar(
        title: Image.asset(
          'assets/images/VaksinKu.png',
          height: 30,
          width: 150,
        ),
        leadingIcon: Icons.logout,
        onPressLeadingIcon: () {},
      ),
      
      // body dalam Scaffold dijadikan widget terpisah
      // ditampilkan widget DashboardView dalam folder /views/dashboard
      body: const DashboardView(),
    );
  }
}


