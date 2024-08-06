import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';

import '../widgets/widgets.dart';

class Statistics extends StatelessWidget {
  final UnitSize inlinePadding;
  final Account user;

  const Statistics({
    super.key,
    required this.inlinePadding,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: make the numbers dynamically added.
    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: inlinePadding),
      child: AppColumn(
        gap: 1.25.rem,
        children: [
          StatisticCard(
            title: "Latest GPA Update",
            onMoreInfo: () {
              //TODO: implement.
            },
            newValue: 2469,
            oldValue: 2347,
          ),
          StatisticCard(
            title: "Courses That You Fail",
            onMoreInfo: () {
              //TODO: implement.
            },
            newValue: 3,
            oldValue: 2,
            isReverse: true,
          ),
          StatisticCard(
            title: "Courses You Passed",
            onMoreInfo: () {
              //TODO: implement.
            },
            newValue: 619,
            oldValue: 614,
            changeMeasure: StatisticsOperation.increase,
          ),
        ],
      ),
    );
  }
}
