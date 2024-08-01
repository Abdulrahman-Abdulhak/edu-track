import 'package:flutter/material.dart';

import '../../../_main/main.dart';
import '../../../utils/utils.dart';
import '../../../types/types.dart';

class AppListTile extends AppStatelessWidget {
  final UnitSize? horizontalTitleGap, minLeadingWidth, minTileHeight;
  final UnitSize? minVerticalPadding;
  final AppEdgeInsetsGeometry? contentPadding;
  final AppTextStyle? leadingAndTrailingTextStyle;
  final AppTextStyle? subtitleTextStyle, titleTextStyle;
  //TODO: implement all borders of type AppShapBorder.
  final ShapeBorder? shape;
  final bool? dense, enableFeedback;
  final Color? focusColor, hoverColor, iconColor, selectedColor;
  final Color? textColor, tileColor, splashColor, selectedTileColor;
  final FocusNode? focusNode;
  final Widget? leading, subtitle, title, trailing;
  final MouseCursor? mouseCursor;
  final VoidFunctionBool? onFocusChange;
  final VoidFunction? onLongPress, onTap;
  final ListTileStyle? style;
  final ListTileTitleAlignment? titleAlignment;
  final VisualDensity? visualDensity;

  final bool autoFocus, enabled, isThreeLine, selected;

  const AppListTile({
    super.key,
    this.horizontalTitleGap,
    this.minLeadingWidth,
    this.minTileHeight,
    this.minVerticalPadding,
    this.contentPadding,
    this.leadingAndTrailingTextStyle,
    this.subtitleTextStyle,
    this.titleTextStyle,
    this.shape,
    this.dense,
    this.enableFeedback,
    this.focusColor,
    this.hoverColor,
    this.iconColor,
    this.selectedColor,
    this.textColor,
    this.tileColor,
    this.splashColor,
    this.selectedTileColor,
    this.focusNode,
    this.leading,
    this.subtitle,
    this.title,
    this.trailing,
    this.mouseCursor,
    this.onFocusChange,
    this.onLongPress,
    this.onTap,
    this.style,
    this.titleAlignment,
    this.visualDensity,
    this.autoFocus = false,
    this.enabled = true,
    this.isThreeLine = false,
    this.selected = false,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final contentPaddingToUse = contentPadding ?? AppEdgeInsets.zero;
    final horizontalTitleGapToUse = horizontalTitleGap ?? 1.rem;
    final minVerticalPaddingToUse = minVerticalPadding ?? UnitSize.zero;

    return ListTile(
      horizontalTitleGap: horizontalTitleGapToUse.compute(context, constraints),
      minLeadingWidth: minLeadingWidth?.compute(context, constraints),
      minTileHeight: minTileHeight?.compute(context, constraints),
      minVerticalPadding: minVerticalPaddingToUse.compute(context, constraints),
      contentPadding: contentPaddingToUse.compute(context, constraints),
      leadingAndTrailingTextStyle: leadingAndTrailingTextStyle?.compute(
        context,
        constraints,
      ),
      subtitleTextStyle: subtitleTextStyle?.compute(context, constraints),
      titleTextStyle: titleTextStyle?.compute(context, constraints),
      shape: shape,
      dense: dense,
      enableFeedback: enableFeedback ?? false,
      focusColor: focusColor,
      hoverColor: hoverColor,
      iconColor: iconColor,
      selectedColor: selectedColor,
      textColor: textColor,
      tileColor: tileColor,
      splashColor: splashColor,
      selectedTileColor: selectedTileColor,
      focusNode: focusNode,
      leading: leading,
      subtitle: subtitle,
      title: title,
      trailing: trailing,
      mouseCursor: mouseCursor,
      onFocusChange: onFocusChange,
      onLongPress: onLongPress,
      onTap: onTap,
      style: style,
      titleAlignment: titleAlignment,
      visualDensity: visualDensity,
      autofocus: autoFocus,
      enabled: enabled,
      isThreeLine: isThreeLine,
      selected: selected,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [
          horizontalTitleGap,
          minLeadingWidth,
          minTileHeight,
          minVerticalPadding,
        ].needsConstraints ||
        AppClass.anyNeedsConstraints([
          contentPadding,
          leadingAndTrailingTextStyle,
          subtitleTextStyle,
          titleTextStyle,
        ]);
  }
}
