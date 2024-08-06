import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

import './texts/texts.dart';

class DateTag extends StatelessWidget {
  final DateTime date;
  const DateTag({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return AppRow(
      gap: .25.rem,
      children: [
        AppIcon(
          icon: AppIcons.clockOutline,
          size: 1.rem,
          color: AppColors.gray500,
        ),
        TextXs(
          "${DateTime.now().toStringWhen(date, context)} (${date.toStringUntilNow(context)})",
          color: AppColors.gray500,
        ),
      ],
    );
  }
}
