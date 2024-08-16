import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class UpdatedCard extends StatelessWidget {
  final Course course;
  final UnitSize cardWidth;

  const UpdatedCard({
    super.key,
    required this.course,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    final newLectures = course.lectures!
        .where(
          (lecture) => AppObject.toBool(lecture.isNew),
        )
        .toList();

    return AppDefaultTextStyle(
      context: context,
      overflow: TextOverflow.ellipsis,
      child: ScrollCard(
        width: cardWidth,
        children: [
          AppColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            gap: .5.rem,
            children: [
              TextMd.semiBold(course.title, color: AppColors.gray900),
              AppRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBadge(
                    color: AppColors.purple700,
                    borderRadius: AppBorderRadius.circular(6.px),
                    padding: AppEdgeInsets.symmetric(
                      horizontal: .5.rem,
                      vertical: .125.rem,
                    ),
                    child: TextXs.medium(
                      "Last Update",
                      color: AppColors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (newLectures.last.date != null)
                    TextXs.medium(
                      newLectures.last.date!.toStringFromNow(context),
                      color: AppColors.purple700,
                    ),
                ],
              ),
            ],
          ),
          Expanded(
            child: AppListView.separated(
              gap: .75.rem,
              itemCount: newLectures.length,
              itemBuilder: (context, index) {
                return AppRow(
                  gap: .25.rem,
                  children: [
                    AppIcon(
                      icon: AppIcons.bookOpen,
                      color: AppColors.purple700,
                      size: 1.rem,
                    ),
                    TextXs.medium(
                      newLectures[index].title,
                      style: const AppTextStyle(
                        color: AppColors.purple700,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.purple700,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          AppButton(
            backgroundColor: Colors.transparent,
            padding: AppEdgeInsets.zero,
            width: 100.vw,
            onPressed: () {
              //TODO: implement.
            },
            child: TextXs.medium("View Course"),
          ),
        ],
      ),
    );
  }
}
