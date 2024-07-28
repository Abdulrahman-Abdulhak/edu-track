import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/types/types.dart';
import 'package:edu_track/utils/utils.dart';

import '../layout/layout.dart';

// use this widget instead of ElevatedButton widget.
class AppButton extends AppStatelessWidget {
  static const _defaultStyle = ButtonStyle(
    elevation: WidgetStatePropertyAll(0),
  );

  //? style properties
  final UnitSize? width, height;
  final AppEdgeInsetsGeometry? padding;
  final AppBorderRadiusGeometry? borderRadius;
  final AppBorderSide? border;
  final Color? backgroundColor;

  //? button properties
  final UnitSize? gap;
  final FocusNode? focusNode;
  final WidgetStatesController? statesController;
  final VoidFunction? onLongPress;
  final VoidFunctionBool? onHover, onFocusChange;
  final Widget? icon;

  final bool autoFocus;
  final Clip clipBehavior;

  final VoidFunction onPressed;
  final Widget child;

  const AppButton({
    super.key,
    // style arguments
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.border,
    this.backgroundColor,
    // button arguments
    this.gap,
    this.focusNode,
    this.onFocusChange,
    this.statesController,
    this.onHover,
    this.onLongPress,
    this.icon,
    this.autoFocus = false,
    this.clipBehavior = Clip.none,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    // button calculated border radius
    final borderRadius = (this.borderRadius ?? AppBorderRadius.zero)
        .compute(context, constraints);

    final buttonStyle = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      padding: WidgetStatePropertyAll(
        padding?.compute(context, constraints),
      ),
      shape: WidgetStatePropertyAll(
        ContinuousRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      side: WidgetStatePropertyAll(border?.compute(context, constraints)),
    ).merge(_defaultStyle);

    return SizedBox(
      width: width?.compute(context, constraints),
      height: height?.compute(context, constraints),
      child: ElevatedButton(
        style: buttonStyle,
        autofocus: autoFocus,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        statesController: statesController,
        onHover: onHover,
        onLongPress: onLongPress,
        onPressed: onPressed,
        child: icon != null
            ? AppRow(
                gap: gap,
                children: [icon, child],
              )
            : child,
      ),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [width, height].needsConstraints ||
        AppClass.anyNeedsConstraints([padding, borderRadius, border]);
  }
}
