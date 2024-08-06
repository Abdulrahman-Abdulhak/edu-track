import 'package:flutter/material.dart';

import '../../layout/layout.dart';
import '../../../_main/main.dart';
import '../../../utils/utils.dart';

class AppLinearProgressIndicator extends StatelessWidget {
  final AppBorderRadiusGeometry borderRadius;
  final Alignment alignment;

  final UnitSize? minHeight;
  final Color? backgroundColor, color;
  //TODO: implement the animation
  final Animation<Color>? valueColor;
  //TODO: make a use out of these.
  final String? semanticsLabel, semanticsValue;
  final double? value;

  const AppLinearProgressIndicator({
    super.key,
    this.borderRadius = const AppBorderRadius.all(
      AppRadius.circular(ViewMax(100)),
    ),
    this.alignment = Alignment.centerLeft,
    this.minHeight,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final constraintsToUse = AppBoxConstraints(minHeight: minHeight ?? .5.rem);
    AppBoxDecoration decoration(Color? color) => AppBoxDecoration(
          color: color,
          borderRadius: borderRadius,
        );

    return AppContainer(
      constraints: constraintsToUse,
      alignment: alignment,
      clipBehavior: Clip.antiAlias,
      decoration: decoration(backgroundColor),
      child: AppContainer(
        constraints: constraintsToUse,
        decoration: decoration(color),
        width: ((value ?? 0) * 100).cqw,
      ),
    );
  }
}
