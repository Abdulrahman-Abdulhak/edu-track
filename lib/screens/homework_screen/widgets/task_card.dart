import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/cards_list.dart';
import 'package:edu_track/widgets/scroll_card.dart';
import 'package:edu_track/widgets/texts/text/text.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {super.key,
      required this.cardType,
      required this.onSeeMore,
      required this.cardCount,
      required this.taskTitle,
      required this.professorName,
      required this.due,
      required this.taskStatus,
      required this.appIcons});
  final String cardType;
  final void Function() onSeeMore;
  final int cardCount;
  final String taskTitle;
  final String professorName;
  final String due;
  final String taskStatus;
  final AppIcons appIcons;

  @override
  Widget build(BuildContext context) {
    return CardsList(
      listHeight: 12.rem,
      name: cardType,
      onSeeMore: onSeeMore,
      cardCount: cardCount,
      cardBuilder: (context, index) {
        return AppPadding(
          padding: AppEdgeInsets.symmetric(
            vertical: .75.rem,
            horizontal: 0.rem,
          ),
          child: ScrollCard(
            width: 12.125.rem,
            gap: .5.rem,
            children: [
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
              TextMd.semiBold(
                taskTitle,
                textAlign: TextAlign.center,
              ),
              TextXs.medium(
                professorName,
                style: AppTextStyle(fontSize: .75.rem),
                textAlign: TextAlign.center,
              ),
              GapVertical(size: 0.rem),
              TextXs.medium(
                due,
                style: AppTextStyle(fontSize: .75.rem),
                textAlign: TextAlign.center,
                color: AppColors.gray400,
              ),
              GapVertical(size: .7.rem),
              AppButton(
                backgroundColor: Colors.transparent,
                onPressed: () {},
                child: AppRow(
                  children: [
                    TextXs.medium(
                      taskStatus,
                      color: AppColors.brand700,
                    ),
                    AppIcon(
                      icon: appIcons,
                      color: AppColors.brand700,
                      size: 1.rem,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
