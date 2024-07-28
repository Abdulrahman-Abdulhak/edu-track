import 'package:flutter/material.dart';

import 'package:edu_track/utils/utils.dart';

import '../../../_app_class.dart';

class AppBorderSide implements AppClass<BorderSide> {
  static const strokeAlignInside = BorderSide.strokeAlignInside;
  static const strokeAlignCenter = BorderSide.strokeAlignCenter;
  static const strokeAlignOutside = BorderSide.strokeAlignOutside;

  static const none = AppBorderSide(
    color: Colors.transparent,
    width: Pixel(0),
  );

  final Color color;
  final UnitSize width;
  final BorderStyle style;
  final double strokeAlign;

  const AppBorderSide({
    this.color = const Color(0xFF000000),
    this.width = const Pixel(1),
    this.style = BorderStyle.solid,
    this.strokeAlign = strokeAlignInside,
  });

  AppBorderSide.fromOrigin(BorderSide borderSide)
      : this(
          color: borderSide.color,
          width: Pixel(borderSide.width),
          style: borderSide.style,
          strokeAlign: borderSide.strokeAlign,
        );

  @override
  BorderSide compute(BuildContext? context, BoxConstraints? constraints) {
    return BorderSide(
      width: width.compute(context, constraints),
      color: color,
      strokeAlign: strokeAlign,
      style: style,
    );
  }

  @override
  bool get needsConstraints => width.needsConstraints;

  @override
  bool get needsContext => width.needsContext;
}
