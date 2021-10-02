import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

class PrimaryRadioInput extends StatelessWidget {
  const PrimaryRadioInput({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.valueSetter,
  }) : super(key: key);

  final Widget title;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) valueSetter;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Radio(
          activeColor: CustomColor.colorPriBase,
          value: value,
          groupValue: groupValue,
          onChanged: (dynamic val) {
            valueSetter(val);
          },
        ),
        GestureDetector(
          onTap: () => valueSetter(value),
          child: title,
        )
      ],
    );
  }
}

class RadioInputSection extends StatelessWidget {
  const RadioInputSection({
    Key? key,
    required this.label,
    required this.groupValue,
    required this.radioChoices,
    required this.valueSetter,
  }) : super(key: key);

  final String label;
  final dynamic groupValue;

  // value pilihan: label
  final Map<dynamic, dynamic> radioChoices;
  final Function(dynamic) valueSetter;

  List<Widget> _buildRadioChoices() {
    List<Widget> widgets = [];
    radioChoices.forEach((choice, titleWidget) {
      widgets.addAll([
        PrimaryRadioInput(
          title: titleWidget,
          groupValue: groupValue,
          value: choice,
          valueSetter: (val) {
            valueSetter(val);
          },
        ),
      ]);
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: typosTextBold(type: TyposType.regular),
        ),
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 15.0,
          children: _buildRadioChoices(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
