import 'package:flutter/material.dart';

import 'package:edu_track/utils/utils.dart';

class AppBorderSide {
  static const strokeAlignInside = -1.0;
  static const strokeAlignCenter = 0.0;
  static const strokeAlignOutside = 1.0;

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

  BorderSide compute(BuildContext? context, BoxConstraints? constraints) {
    return BorderSide(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width.compute(context, constraints),
    );
  }

  bool get needsConstraints => width.needsConstraints;
}
