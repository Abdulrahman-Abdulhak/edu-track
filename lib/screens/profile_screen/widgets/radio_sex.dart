import 'package:edu_track/widgets/texts/texts.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class RadioSex extends StatelessWidget {
  const RadioSex(
      {super.key,
      required this.groupValue,
      required this.value,
      required this.sex,
      required this.onChanged});
  final int value;
  final int groupValue;
  final String sex;
  final void Function(int?) onChanged;

  @override
  Widget build(BuildContext context) {
    return AppRow(
      children: [
        Radio(
          activeColor: AppColors.brand700,
          hoverColor: AppColors.gray100,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        TextSm.medium(sex),
      ],
    );
  }
}
