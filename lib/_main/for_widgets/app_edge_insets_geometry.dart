import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:edu_track/utils/utils.dart';

import '../_app_class.dart';

// a substitute for EdgeInsetsGeometry that can use the {UnitSize} class
abstract class AppEdgeInsetsGeometry implements AppClass<EdgeInsetsGeometry> {
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
}
