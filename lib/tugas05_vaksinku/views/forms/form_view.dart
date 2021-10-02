import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/styles/typos.dart';
import 'package:kolaborasi_gits_app/tugas05_vaksinku/widgets/primary_button.dart';
import 'form_page.dart';

enum GenderGen { man, woman }

class FormView extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<FormView> {
  GenderGen? _character = GenderGen.man;
  @override
  Widget build(BuildContext context) {
    // widget PageContainer dari folder /widgets
    return Scaffold(
      body: ListView(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Text(
                "Tambah Pendaftar",
                style: typosTextBold(type: TyposType.large),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'NIK',
                    style: typosTextBold(type: TyposType.large),
                  ),
                ],
              ),
              TextField(
                keyboardType: TextInputType.phone,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 16,
                decoration: InputDecoration(
                  hintText: "Masukan No NIK...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Nama Lengkap',
                    style: typosTextBold(type: TyposType.large),
                  ),
                ],
              ),
              TextField(
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  hintText: "Nama lengkap sesuai KTP...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Jenis Kelamin',
                    style: typosTextBold(type: TyposType.large),
                  ),
                ],
              ),
              RadioListTile<GenderGen>(
                title: const Text('Laki-Laki'),
                value: GenderGen.man,
                groupValue: _character,
                onChanged: (GenderGen? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<GenderGen>(
                title: const Text('Perempuan'),
                value: GenderGen.woman,
                groupValue: _character,
                onChanged: (GenderGen? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Row(
                children: [
                  Text(
                    'Tanggal Vaksinasi Ke-1',
                    style: typosTextBold(type: TyposType.large),
                  ),
                ],
              ),
              TextField(
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  hintText: "DD/MM/YYYY",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Tanggal Vaksinasi Ke-2',
                    style: typosTextBold(type: TyposType.large),
                  ),
                ],
              ),
              TextField(
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  hintText: "DD/MM/YYYY",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                buttonText: "Tambah",
                buttonOnPressed: () {
                  Navigator.pushNamed(context, '/tambah');
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
