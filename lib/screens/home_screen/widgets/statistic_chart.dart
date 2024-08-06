import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class StatisticChart extends StatelessWidget {
  final bool isSuccess;
  final UnitSize? width, height;

  const StatisticChart({
    super.key,
    this.width,
    this.height,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final pathToUse = isSuccess ? AppImages.chartSuccess : AppImages.chartFail;

    return AppImage(
      fit: BoxFit.fill,
      path: pathToUse,
      width: width,
      height: height,
    );
  }
}
