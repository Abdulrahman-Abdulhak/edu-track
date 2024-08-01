import 'package:flutter/material.dart';

import 'package:edu_track/utils/utils.dart';

import './addons/addons.dart';
import './app_box_border.dart';
import './app_shape_border.dart';

abstract class AppInputBorder extends AppShapeBorder {
  static const none = _NoAppInputBorder();

  static AppInputBorder? fromOrigin(Object? border) {
    if (border == null) return null;

    return switch (border.runtimeType) {
      UnderlineInputBorder _ => AppUnderlineInputBorder.fromOrigin(
          border as UnderlineInputBorder,
        ),
      _ => throw "The border passed isn't defined for AppInputBorder",
    };
  }

  final AppBorderSide borderSide;

  const AppInputBorder({this.borderSide = AppBorderSide.none});

  @override
  InputBorder compute(BuildContext? context, BoxConstraints? constraints);

  @override
  bool get needsConstraints => borderSide.needsConstraints;

  @override
  bool get needsContext => borderSide.needsContext;

  AppBorderRadius get borderRadiusValue;

  AppBoxBorder toBorderBox();
}

class AppUnderlineInputBorder extends AppInputBorder {
  final AppBorderRadius borderRadius;

  const AppUnderlineInputBorder({
    super.borderSide = const AppBorderSide(),
    this.borderRadius = AppBorderRadius.zero,
  });

  AppUnderlineInputBorder.fromOrigin(UnderlineInputBorder border)
      : this(
          borderSide: AppBorderSide.fromOrigin(border.borderSide),
          borderRadius: AppBorderRadius.fromOrigin(border.borderRadius),
        );

  @override
  UnderlineInputBorder compute(
    BuildContext? context,
    BoxConstraints? constraints,
  ) {
    return UnderlineInputBorder(
      borderSide: super.borderSide.compute(context, constraints),
      borderRadius: borderRadius.compute(context, constraints),
    );
  }

  @override
  bool get needsConstraints =>
      super.needsConstraints || borderRadius.needsConstraints;

  @override
  bool get needsContext => super.needsContext || borderRadius.needsContext;

  @override
  AppBorderRadius get borderRadiusValue => borderRadius;

  @override
  AppBoxBorder toBorderBox() {
    return AppBorder(
      bottom: borderSide,
    );
  }
}

class AppOutlineInputBorder extends AppInputBorder {
  final UnitSize gapPadding;
  final AppBorderRadius borderRadius;

  const AppOutlineInputBorder({
    super.borderSide = const AppBorderSide(),
    this.borderRadius = AppBorderRadius.zero,
    this.gapPadding = const Pixel(4),
  });

  AppOutlineInputBorder.fromOrigin(OutlineInputBorder border)
      : this(
          borderSide: AppBorderSide.fromOrigin(border.borderSide),
          borderRadius: AppBorderRadius.fromOrigin(border.borderRadius),
          gapPadding: Pixel(border.gapPadding),
        );

  @override
  OutlineInputBorder compute(
    BuildContext? context,
    BoxConstraints? constraints,
  ) {
    return OutlineInputBorder(
      borderSide: super.borderSide.compute(context, constraints),
      borderRadius: borderRadius.compute(context, constraints),
      gapPadding: gapPadding.compute(context, constraints),
    );
  }

  @override
  bool get needsConstraints =>
      super.needsConstraints ||
      borderRadius.needsConstraints ||
      gapPadding.needsConstraints;

  @override
  bool get needsContext =>
      super.needsContext ||
      borderRadius.needsContext ||
      gapPadding.needsContext;

  @override
  AppBorderRadius get borderRadiusValue => borderRadius;

  @override
  AppBoxBorder toBorderBox() {
    return AppBorder.fromBorderSide(borderSide);
  }
}

class _NoAppInputBorder extends AppInputBorder {
  const _NoAppInputBorder();

  @override
  InputBorder compute(BuildContext? context, BoxConstraints? constraints) {
    return InputBorder.none;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => false;

  @override
  AppBorderRadius get borderRadiusValue => AppBorderRadius.zero;

  @override
  AppBoxBorder toBorderBox() {
    return AppBorder.none;
  }
}
