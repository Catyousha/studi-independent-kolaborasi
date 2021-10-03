import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

// widget buatan dibuat sebagai class
class PrimaryTextInput extends StatelessWidget {
  // parameter buatan sendiri agar lebih custom
  const PrimaryTextInput({
    Key? key,
    required this.label, // tulisan diatas input
    this.labelText, // teks placeholder
    this.initialValue, // value awal dalam inputan
    this.numberInput = false, // penentu inputan berupa angka
    this.inputFormatters, // formatter input
    this.isRequired = true, // penentu input wajib diisi
    required this.valueSetter, // fungsi pengubah value dengan isian inputan
  }) : super(key: key);

  final String label;
  final String? labelText;
  final String? initialValue;
  final bool numberInput;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final Function(String?) valueSetter;

  @override
  Widget build(BuildContext context) {
    InputBorder _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: CustomColor.colorSkyLight,
        width: 1.0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: typosTextBold(type: TyposType.regular),
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          inputFormatters: inputFormatters,
          keyboardType:
              (numberInput) ? TextInputType.number : TextInputType.text,
          initialValue: initialValue,
          style: typosTextRegular(
            type: TyposType.regular,
            color: CustomColor.colorInkLighter,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColor.colorSkyWhite,
            enabledBorder: _inputBorder,
            errorBorder: _inputBorder,
            focusedErrorBorder: _inputBorder,
            focusedBorder: _inputBorder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: labelText ?? "Masukkan $label...",
            contentPadding: const EdgeInsets.all(16.0),
          ),

          // kalau tombol submit ditekan, validasi dengan validator
          validator: (value) {
            if ((value == null || value.isEmpty) && isRequired) {
              return 'Kolom ini wajib diisi!';
            }
            return null;
          },

          // ketika validasi berhasil dan form disimpan, set value dengan isian pada inputan
          onSaved: (String? val) {
            valueSetter(val);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
