import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../_app_class.dart';

// a substitute for EdgeInsetsGeometry that can use the {UnitSize} class
abstract class AppEdgeInsetsGeometry implements AppClass<EdgeInsetsGeometry> {
  static AppEdgeInsetsGeometry? fromOrigin(Object? edge) {
    if (edge == null) return null;

    return switch (edge.runtimeType) {
      EdgeInsets => AppEdgeInsets.fromOrigin(edge as EdgeInsets),
      EdgeInsetsDirectional => AppEdgeInsetsDirectional.fromOrigin(
          edge as EdgeInsetsDirectional,
        ),
      _ => throw "The border passed isn't defined for AppEdgeInsetsGeometry",
    };
  }

  const AppEdgeInsetsGeometry();

  @override
  EdgeInsetsGeometry compute(
    BuildContext? context,
    BoxConstraints? constraints,
  );

  @override
  bool get needsContext => _properties.needsContext;
  @override
  bool get needsConstraints => _properties.needsConstraints;

  List<UnitSize> get _properties;

  UnitSize get _left;
  UnitSize get _top;
  UnitSize get _right;
  UnitSize get _bottom;
  UnitSize get _start;
  UnitSize get _end;

  UnitSize get horizontal => _left + _right + _start + _end;
  UnitSize get vertical => _top + _bottom;
}

// a substitute for EdgeInsets that can use the {UnitSize} class
class AppEdgeInsets extends AppEdgeInsetsGeometry {
  static const AppEdgeInsets zero = AppEdgeInsets.all(UnitSize.zero);

  final UnitSize left, top, right, bottom;

  const AppEdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);

  const AppEdgeInsets.all(UnitSize value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const AppEdgeInsets.only({
    this.left = UnitSize.zero,
    this.top = UnitSize.zero,
    this.right = UnitSize.zero,
    this.bottom = UnitSize.zero,
  });

  const AppEdgeInsets.symmetric({
    UnitSize horizontal = UnitSize.zero,
    UnitSize vertical = UnitSize.zero,
  })  : left = horizontal,
        right = horizontal,
        top = vertical,
        bottom = vertical;

  AppEdgeInsets.fromViewPadding(ViewPadding padding, double devicePixelRatio)
      : left = Pixel(padding.left / devicePixelRatio),
        top = Pixel(padding.top / devicePixelRatio),
        right = Pixel(padding.right / devicePixelRatio),
        bottom = Pixel(padding.bottom / devicePixelRatio);

  AppEdgeInsets.fromOrigin(EdgeInsets insets)
      : left = insets.left.px,
        top = insets.top.px,
        right = insets.right.px,
        bottom = insets.bottom.px;

  @override
  EdgeInsets compute(BuildContext? context, BoxConstraints? constraints) {
    return EdgeInsets.fromLTRB(
      left.compute(context, constraints),
      top.compute(context, constraints),
      right.compute(context, constraints),
      bottom.compute(context, constraints),
    );
  }

  @override
  List<UnitSize> get _properties => [left, top, right, bottom];

  @override
  UnitSize get _left => left;

  @override
  UnitSize get _top => top;

  @override
  UnitSize get _right => right;

  @override
  UnitSize get _bottom => bottom;

  @override
  UnitSize get _start => UnitSize.zero;

  @override
  UnitSize get _end => UnitSize.zero;
}

// a substitute for EdgeInsetsDirectional that can use the {UnitSize} class
class AppEdgeInsetsDirectional extends AppEdgeInsetsGeometry {
  static const AppEdgeInsetsDirectional zero = AppEdgeInsetsDirectional.all(
    UnitSize.zero,
  );

  final UnitSize start, top, end, bottom;

  const AppEdgeInsetsDirectional.fromSTEB(
    this.start,
    this.top,
    this.end,
    this.bottom,
  );

  const AppEdgeInsetsDirectional.all(UnitSize value)
      : start = value,
        top = value,
        end = value,
        bottom = value;

  const AppEdgeInsetsDirectional.only({
    this.start = UnitSize.zero,
    this.top = UnitSize.zero,
    this.end = UnitSize.zero,
    this.bottom = UnitSize.zero,
  });

  const AppEdgeInsetsDirectional.symmetric({
    UnitSize horizontal = UnitSize.zero,
    UnitSize vertical = UnitSize.zero,
  })  : start = horizontal,
        end = horizontal,
        top = vertical,
        bottom = vertical;

  AppEdgeInsetsDirectional.fromOrigin(EdgeInsetsDirectional insets)
      : start = insets.start.px,
        top = insets.top.px,
        end = insets.end.px,
        bottom = insets.bottom.px;

  @override
  EdgeInsetsDirectional compute(
    BuildContext? context,
    BoxConstraints? constraints,
  ) {
    return EdgeInsetsDirectional.fromSTEB(
      start.compute(context, constraints),
      top.compute(context, constraints),
      end.compute(context, constraints),
      bottom.compute(context, constraints),
    );
  }

  @override
  List<UnitSize> get _properties => [start, top, end, bottom];

  @override
  UnitSize get _left => UnitSize.zero;

  @override
  UnitSize get _top => top;

  @override
  UnitSize get _right => UnitSize.zero;

  @override
  UnitSize get _bottom => bottom;

  @override
  UnitSize get _start => start;

  @override
  UnitSize get _end => end;
}
