import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class ScrollCard extends StatelessWidget {
  final List<Widget> children;
  final UnitSize width;

  const ScrollCard({super.key, required this.children, required this.width});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: width,
      padding: AppEdgeInsets.symmetric(horizontal: 1.rem, vertical: .75.rem),
      decoration: AppBoxDecoration(
        border: AppBorder.all(color: AppColors.gray200),
        borderRadius: AppBorderRadius.circular(12.px),
      ),
      child: AppColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        gap: 1.rem,
        children: children,
      ),
    );
  }
}
