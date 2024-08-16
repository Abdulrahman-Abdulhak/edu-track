import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../../../widgets/texts/text/text.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.task});
  final String task;

  @override
  Widget build(BuildContext context) {
    return AppRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextLg.semiBold(task),
        AppBadge(
          color: AppColors.gray100,
          icon: AppIcons.calendar,
          iconColor: AppColors.gray500,
          iconSize: 1.rem,
          iconGap: .25.rem,
          label: DateTime.now().toStringWhen(
            DateTime.now(),
            context,
            false,
          ),
          borderRadius: AppBorderRadius.circular(1.rem),
          labelColor: AppColors.gray500,
          padding: AppEdgeInsets.symmetric(
            vertical: .125.rem,
            horizontal: .5.rem,
          ),
          textStyle: Typographies.textXs.withStyles(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
