import 'package:flutter/widgets.dart';

import './addons/addons.dart';
import './app_shape_border.dart';
import '../../../utils/utils.dart';

abstract class AppBoxBorder extends AppShapeBorder {
  static AppBoxBorder? fromOrigin(Object? border) {
    if (border == null) return null;

    return switch (border.runtimeType) {
      Border _ => AppBorder.fromOrigin(border as Border),
      _ => throw "The border passed isn't defined for AppBoxBorder",
    };
  }

  const AppBoxBorder();

  @override
  BoxBorder compute(BuildContext? context, BoxConstraints? constraints);

  @override
  bool get needsConstraints;

  @override
  bool get needsContext;
}

class AppBorder extends AppBoxBorder {
  static const none = AppBorder.fromBorderSide(AppBorderSide.none);

  final AppBorderSide left, top, right, bottom;

  const AppBorder({
    this.left = AppBorderSide.none,
    this.top = AppBorderSide.none,
    this.right = AppBorderSide.none,
    this.bottom = AppBorderSide.none,
  });

  const AppBorder.fromBorderSide(AppBorderSide side)
      : left = side,
        top = side,
        right = side,
        bottom = side;

  const AppBorder.symmetric({
    AppBorderSide horizontal = AppBorderSide.none,
    AppBorderSide vertical = AppBorderSide.none,
  })  : left = horizontal,
        right = horizontal,
        top = vertical,
        bottom = vertical;

  factory AppBorder.all({
    final Color color = const Color(0xFF000000),
    final UnitSize width = const Pixel(1),
    final BorderStyle style = BorderStyle.solid,
    final double strokeAlign = AppBorderSide.strokeAlignInside,
  }) {
    final side = AppBorderSide(
        color: color, width: width, style: style, strokeAlign: strokeAlign);
    return AppBorder.fromBorderSide(side);
  }

  AppBorder.fromOrigin(Border border)
      : left = AppBorderSide.fromOrigin(border.left),
        top = AppBorderSide.fromOrigin(border.top),
        right = AppBorderSide.fromOrigin(border.right),
        bottom = AppBorderSide.fromOrigin(border.bottom);

  @override
  Border compute(BuildContext? context, BoxConstraints? constraints) {
    return Border(
      left: left.compute(context, constraints),
      top: top.compute(context, constraints),
      right: right.compute(context, constraints),
      bottom: bottom.compute(context, constraints),
    );
  }

  @override
  bool get needsConstraints => [left, top, right, bottom].needsConstraints;

  @override
  bool get needsContext => [left, top, right, bottom].needsContext;
}
