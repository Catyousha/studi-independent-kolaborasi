import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/typos.dart';

class PrimaryDateInput extends StatelessWidget {
  const PrimaryDateInput({
    Key? key,
    required this.label,
    required this.dateText,
    this.initialDate,
    required this.valueSetter,
  }) : super(key: key);

  final String label;
  final String? dateText;
  final DateTime? initialDate;
  final Function(dynamic) valueSetter;

  void _selectDate(BuildContext context) async {
    DateTime? __initialDate = initialDate ?? DateTime.now();
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: __initialDate,
      firstDate: DateTime(1945),
      lastDate: DateTime(2022),
    );
    if (newDate != null) {
      valueSetter(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: typosTextBold(type: TyposType.regular),
        ),
        const SizedBox(height: 12.0),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              color: CustomColor.colorSkyWhite,
              border: Border.all(
                color: CustomColor.colorSkyLight,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: CustomColor.colorInkLighter,
                ),
                const SizedBox(width: 8.0),
                Text(
                  '$dateText',
                  style: typosTextRegular(
                    type: TyposType.tiny,
                    color: CustomColor.colorInkLighter,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
