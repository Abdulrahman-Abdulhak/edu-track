import 'package:flutter/material.dart';

import '../../text/text.dart';
import '../../layout/layout.dart';
import '../../icons/app_icon.dart';
import '../../../_main/main.dart';
import '../../../utils/utils.dart';

class AppBadge extends StatelessWidget {
  final UnitSize? iconSize, iconGap;
  final AppBoxBorder? border;
  final AppTextStyle? textStyle;

  final Color? color, labelColor, iconColor;
  final Object? label;
  final AppIcons? icon;
  final Widget? child, iconWidget;

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
    this.iconSize,
    this.iconGap,
    this.iconColor,
    this.icon,
    this.iconWidget,
    this.padding = const AppEdgeInsets.symmetric(
      vertical: Em(.125),
      horizontal: Em(.625),
    ),
    this.borderRadius = const AppBorderRadius.all(
      AppRadius.circular(ViewMax(100)),
    ),
  })  : assert(
          label != null || child != null,
          "AppBadge can't have {label} and {child} to be both null",
        ),
        assert(
          label == null || child == null,
          "AppBadge can't display both {label} and {child} at the same time",
        ),
        assert(
          icon == null || iconWidget == null,
          "AppBadge can't display both {label} and {iconWidget} at the same time",
        );

  @override
  Widget build(BuildContext context) {
    final textStyleToUse = labelColor != null
        ? AppTextStyle(color: labelColor).merge(textStyle)
        : textStyle;

    Widget result = child ??
        AppText(
          "$label",
          textAlign: TextAlign.center,
          style: textStyleToUse,
        );

    if (icon != null || iconWidget != null) {
      final iconToUse = iconWidget ??
          AppIcon(
            icon: icon!,
            color: iconColor,
            size: iconSize,
          );

      result = AppRow(
        mainAxisSize: MainAxisSize.min,
        gap: iconGap,
        children: [
          iconToUse,
          result,
        ],
      );
    }

    return AppContainer(
      alignment: Alignment.center,
      padding: padding,
      decoration: AppBoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: border,
      ),
      child: result,
    );
  }
}
