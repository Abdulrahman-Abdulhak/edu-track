import 'package:flutter/material.dart';

import '../../text/text.dart';
import '../../layout/layout.dart';
import '../../../_main/main.dart';
import '../../../utils/utils.dart';

class AppBadge extends StatelessWidget {
  final AppBoxBorder? border;
  final AppTextStyle? textStyle;

  final Color? color, labelColor;
  final Object? label;
  final Widget? child;

  final AppEdgeInsetsGeometry padding;
  final AppBorderRadiusGeometry borderRadius;

  const AppBadge({
    super.key,
    this.border,
    this.textStyle,
    this.color,
    this.labelColor,
    this.label,
    this.child,
    this.padding = const AppEdgeInsets.symmetric(
      vertical: Em(.125),
      horizontal: Em(.625),
    ),
    this.borderRadius = const AppBorderRadius.all(
      AppRadius.circular(ViewMax(100)),
    ),
  })  : assert(
          !(label == null && child == null),
          "AppBadge can't have {label} and {child} to be both null",
        ),
        assert(
          !(label != null && child != null),
          "AppBadge can't display both {label} and {child} at the same time",
        );

  @override
  Widget build(BuildContext context) {
    final textStyleToUse = labelColor != null
        ? AppTextStyle(color: labelColor).merge(textStyle)
        : textStyle;

    return AppContainer(
      padding: padding,
      decoration: AppBoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: border,
      ),
      child: child ??
          AppText(
            "$label",
            textAlign: TextAlign.center,
            style: textStyleToUse,
          ),
    );
  }
}
