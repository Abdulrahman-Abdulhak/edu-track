import 'dart:math';

import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import '../widgets/widgets.dart';

enum StatisticsOperation {
  percentage('%'),
  increase('+', '-');

  final String sign;
  final String? decreaseSign;

  const StatisticsOperation(this.sign, [this.decreaseSign]);
}

class StatisticCard extends StatelessWidget {
  // if true that means when the new value is less than the old value
  // it's a success case
  final bool isReverse;

  // a value represents how to measure the difference in value.
  final StatisticsOperation changeMeasure;

  final String title;
  final VoidFunction onMoreInfo;
  final int newValue, oldValue;

  const StatisticCard({
    super.key,
    this.isReverse = false,
    this.changeMeasure = StatisticsOperation.percentage,
    required this.title,
    required this.onMoreInfo,
    required this.newValue,
    required this.oldValue,
  });

  @override
  Widget build(BuildContext context) {
    final arrow = isIncrease ? AppIcons.arrowUp : AppIcons.arrowDown;
    final iconColor = isSuccess ? AppColors.success500 : AppColors.error500;
    final numColor = isSuccess ? AppColors.success700 : AppColors.error700;
    final message = switch (changeMeasure) {
      StatisticsOperation.increase => "to your total value",
      StatisticsOperation.percentage => "vs last time",
    };

    return AppContainer(
      padding: AppEdgeInsets.symmetric(horizontal: 1.rem, vertical: 1.25.rem),
      decoration: AppBoxDecoration(
        borderRadius: AppBorderRadius.circular(12.px),
        color: AppColors.white,
        shadows: const [shadowXs],
      ),
      child: AppColumn(
        gap: 1.25.rem,
        children: [
          AppRow(
            gap: .5.rem,
            children: [
              Expanded(
                child: TextMd.semiBold(title, color: AppColors.gray900),
              ),
              AppIconButton(
                onPressed: onMoreInfo,
                icon: AppIcons.moreVertical,
                size: 1.25.rem,
                color: AppColors.gray400,
              ),
            ],
          ),
          AppRow(
            gap: 1.rem,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: AppColumn(
                  gap: 1.rem,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextDisplaySm.semiBold(
                      newValue.thousandComma(context),
                      color: AppColors.gray900,
                    ),
                    AppRow(
                      children: [
                        AppIcon(
                          icon: arrow,
                          color: iconColor,
                          size: 1.25.rem,
                        ),
                        GapHorizontal(size: .25.rem),
                        TextSm.medium(computeChange(), color: numColor),
                        GapHorizontal(size: .5.rem),
                        TextSm.medium(
                          message,
                          textTransform: TextTransform.none,
                          color: AppColors.gray600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(child: StatisticChart(isSuccess: isSuccess))
            ],
          ),
        ],
      ),
    );
  }

  bool get isIncrease => oldValue < newValue;

  bool get isSuccess => AppObject.xor(isReverse, isIncrease);

  String computeChange() {
    final Sign = isIncrease
        ? changeMeasure.sign
        : changeMeasure.decreaseSign ?? changeMeasure.sign;

    final result = switch (changeMeasure) {
      StatisticsOperation.increase => (oldValue - newValue).abs(),
      StatisticsOperation.percentage =>
        (max(oldValue, newValue) / min(oldValue, newValue) - 1) * 100,
    }
        .round();

    return '$result$Sign';
  }
}
