import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class ScrollCard extends StatelessWidget {
  final List<Widget> children;
  final UnitSize width, gap;

  const ScrollCard({
    super.key,
    this.gap = const Rem(1),
    required this.children,
    required this.width,
  });

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
        gap: gap,
        children: children,
      ),
    );
  }
}
