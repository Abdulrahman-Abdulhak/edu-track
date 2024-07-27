import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/types/types.dart';
import 'package:edu_track/utils/utils.dart';

// use this widget instead of ElevatedButton widget.
class AppButton extends AppStatelessWidget {
  static const _defaultStyle = ButtonStyle(
    elevation: MaterialStatePropertyAll(0),
  );

  //? style properties
  final UnitSize? width, height;
  final Color? backgroundColor;
  final AppEdgeInsetsGeometry? padding;
  final AppBorderRadiusGeometry? borderRadius;
  final AppBorderSide? border;

  //? button properties
  final FocusNode? focusNode;
  final MaterialStatesController? statesController;
  final VoidFunction? onLongPress;
  final VoidFunctionBool? onHover, onFocusChange;
  final Widget? icon;
  final UnitSize? gap;

  final bool autoFocus;
  final Clip clipBehavior;

  final VoidFunction onPressed;
  final Widget child;

  const AppButton({
    super.key,
    // style arguments
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.border,
    // button arguments
    this.focusNode,
    this.onFocusChange,
    this.statesController,
    this.onHover,
    this.onLongPress,
    this.icon,
    this.gap,
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
      backgroundColor: MaterialStatePropertyAll(backgroundColor),
      padding: MaterialStatePropertyAll(
        padding?.compute(context, constraints),
      ),
      shape: MaterialStatePropertyAll(
        ContinuousRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      side: MaterialStatePropertyAll(border?.compute(context, constraints)),
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
    return UnitSize.anyNeedsConstraints([width, height]) ||
        padding != null && padding!.needsConstraints ||
        borderRadius != null && borderRadius!.needsConstraints ||
        border != null && border!.needsConstraints;
  }
}
