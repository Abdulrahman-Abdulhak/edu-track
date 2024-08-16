import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../../../widgets/texts/texts.dart';

class Subject extends StatelessWidget {
  const Subject(
      {super.key,
      required this.subjectTitle,
      required this.appIcons,
      required this.backgroundColor,
      required this.iconColor});
  final String subjectTitle;
  final AppIcons appIcons;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return AppRow(
      gap: .5.rem,
      children: [
        AppBadge(
          borderRadius: AppBorderRadius.all(
            AppRadius.circular(.5.rem),
          ),
          color: backgroundColor,
          child: AppIcon(
            icon: appIcons,
            color: iconColor,
            size: 1.5.rem,
          ),
        ),
        TextLg.semiBold(subjectTitle),
      ],
    );
  }
}
