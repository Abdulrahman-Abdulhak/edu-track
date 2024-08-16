import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/texts/texts.dart';
import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(
      {super.key,
      required this.details,
      required this.status,
      required this.appIcons});
  final String details;
  final String status;
  final AppIcons appIcons;

  @override
  Widget build(BuildContext context) {
    return AppRow(
      children: [
        TextXs.medium(details),
        AppBadge(
          color: AppColors.gray100,
          child: AppRow(
            gap: .5.rem,
            children: [
              TextXs.medium(status),
              AppIcon(
                icon: appIcons,
                color: AppColors.gray500,
                size: .75.rem,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
