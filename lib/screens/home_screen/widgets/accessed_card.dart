import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class AccessedCard extends StatelessWidget {
  final Course course;
  final UnitSize cardWidth;
  const AccessedCard({
    super.key,
    required this.course,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    final color = course.type.color;
    final percentageFinished = this.percentageFinished();

    return AppDefaultTextStyle(
      context: context,
      overflow: TextOverflow.ellipsis,
      child: ScrollCard(
        width: cardWidth,
        children: [
          AppRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppAvatar(
                padding: AppEdgeInsets.all(.25.rem),
                borderRadius: .5.rem,
                color: color[100],
                child: AppIcon(
                  icon: course.type.icon,
                  color: color[600],
                  size: 1.25.rem,
                ),
              ),
              AppBadge(
                icon: AppIcons.calendar,
                iconColor: AppColors.gray500,
                iconSize: .75.rem,
                iconGap: .25.rem,
                color: AppColors.gray100,
                child: TextSm.medium(
                  DateFormat('EEEE y').format(course.signupDate),
                  color: AppColors.gray500,
                ),
              ),
            ],
          ),
          AppColumn(
            gap: .75.rem,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextMd.semiBold(
                course.title,
                color: AppColors.gray900,
                maxLineCount: 1,
              ),
              GapVertical(size: .5.rem),
              AppRow(
                gap: .25.rem,
                children: [
                  AppIcon(
                    icon: AppIcons.profile,
                    color: AppColors.gray500,
                    size: 1.rem,
                  ),
                  TextXs.medium(
                    "Prof.${course.professor.name.capitalizeWord()}",
                    maxLineCount: 1,
                    color: AppColors.gray500,
                  ),
                ],
              ),
              AppLinearProgressIndicator(
                minHeight: .5.rem,
                backgroundColor: color[100],
                color: color[600],
                value: percentageFinished,
              ),
              AppRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextXs.semiBold("progress", color: color[700]),
                  TextXs.semiBold(
                    "${(percentageFinished * 100).round()}%",
                    color: AppColors.gray500,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  double percentageFinished() {
    final lectures = course.lectures ?? const [];
    if (lectures.isEmpty) return 0;

    bool isFinished(Lecture lecture) => AppObject.toBool(lecture.finished);
    final percentageFinished = lectures.toValue((acc, item) {
          return isFinished(item) ? acc + 1 : acc;
        }, 0) /
        lectures.length;

    return percentageFinished;
  }
}
