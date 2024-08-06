import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import './scroll_card.dart';

class UpcomingCard extends StatelessWidget {
  final Course course;
  final Lecture lecture;

  final UnitSize cardWidth;

  const UpcomingCard({
    super.key,
    required this.course,
    required this.lecture,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    final color = course.type.color;

    return AppDefaultTextStyle(
      context: context,
      overflow: TextOverflow.ellipsis,
      child: ScrollCard(
        width: cardWidth,
        children: [
          AppRow(
            gap: .5.rem,
            children: [
              AppBadge(
                child: AppIcon(
                  icon: course.type.icon,
                  color: color[600],
                  size: 1.25.rem,
                ),
              ),
              TextXs.semiBold(course.label, color: color[700]),
            ],
          ),
          AppColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: .25.rem,
            children: [
              // to prevent stretching the badge.
              AppRow(
                children: [
                  AppBadge(
                    iconGap: 0.375.rem,
                    color: AppColors.brand50,
                    icon: AppIcons.dot,
                    iconColor: AppColors.brand500,
                    child: TextXs.medium(
                      course.organization.name,
                      color: AppColors.brand700,
                    ),
                  ),
                ],
              ),
              TextSm.semiBold(course.title, color: AppColors.gray900),
              AppRow(
                gap: .25.rem,
                children: [
                  AppIcon(
                    icon: AppIcons.clockOutline,
                    size: 1.rem,
                    color: AppColors.gray500,
                  ),
                  TextXs(
                    DateTime.now().toStringWhen(lecture.date!, context),
                    color: AppColors.gray500,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          AppRow(
            gap: 1.rem,
            children: [
              AppButton(
                onPressed: () {
                  //TODO: implement.
                },
                padding: AppEdgeInsets.symmetric(
                  horizontal: 1.rem,
                  vertical: .5.rem,
                ),
                backgroundColor: color[700],
                borderRadius: AppBorderRadius.circular(.5.rem),
                child: TextSm.semiBold("Join Class", color: AppColors.white),
              ),
              AppIconButton(
                onPressed: () {
                  //TODO: implement.
                },
                icon: AppIcons.notification,
                color: color[700],
                backgroundColor: color[50],
                padding: AppEdgeInsets.all(.5.rem),
                borderRadius: AppBorderRadius.circular(.5.rem),
              )
            ],
          ),
        ],
      ),
    );
  }
}
