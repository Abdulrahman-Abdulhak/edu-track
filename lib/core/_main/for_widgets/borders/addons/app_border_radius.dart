import 'package:flutter/material.dart';

import 'app_radius.dart';
import '../../../_app_class.dart';
import '../../../../utils/utils.dart';

abstract class AppBorderRadiusGeometry
    implements AppClass<BorderRadiusGeometry> {
  static AppBorderRadiusGeometry? fromOrigin(Object? borderRadius) {
    if (borderRadius == null) return null;

    return switch (borderRadius.runtimeType) {
      AppBorderRadius => AppBorderRadius.fromOrigin(
          borderRadius as BorderRadius,
        ),
      AppBorderRadiusDirectional => AppBorderRadiusDirectional.fromOrigin(
          borderRadius as BorderRadiusDirectional,
        ),
      _ => throw "The border passed isn't defined for AppBorderRadiusGeometry",
    };
  }

  const AppBorderRadiusGeometry();

  @override
  BorderRadiusGeometry compute(
    BuildContext? context,
    BoxConstraints? constraints,
  );

  @override
  bool get needsContext => _properties.needsContext;

  @override
  bool get needsConstraints => _properties.needsConstraints;

  List<AppRadius> get _properties;
}

class AppBorderRadius extends AppBorderRadiusGeometry {
  static const AppBorderRadius zero = AppBorderRadius.all(AppRadius.zero);

  final AppRadius topLeft, topRight, bottomRight, bottomLeft;

  const AppBorderRadius.all(AppRadius radius)
      : this.only(
          bottomLeft: radius,
          bottomRight: radius,
          topLeft: radius,
          topRight: radius,
        );

  AppBorderRadius.circular(UnitSize radius)
      : this.all(AppRadius.circular(radius));

  const AppBorderRadius.vertical({
    final top = AppRadius.zero,
    final bottom = AppRadius.zero,
  }) : this.only(
          bottomLeft: bottom,
          bottomRight: bottom,
          topLeft: top,
          topRight: top,
        );

  const AppBorderRadius.horizontal({
    final left = AppRadius.zero,
    final right = AppRadius.zero,
  }) : this.only(
          bottomLeft: left,
          topLeft: left,
          bottomRight: right,
          topRight: right,
        );

  const AppBorderRadius.only({
    this.topLeft = AppRadius.zero,
    this.topRight = AppRadius.zero,
    this.bottomRight = AppRadius.zero,
    this.bottomLeft = AppRadius.zero,
  });

  AppBorderRadius.fromOrigin(BorderRadius borderRadius)
      : this.only(
          topLeft: AppRadius.fromOrigin(borderRadius.topLeft),
          topRight: AppRadius.fromOrigin(borderRadius.topRight),
          bottomRight: AppRadius.fromOrigin(borderRadius.bottomRight),
          bottomLeft: AppRadius.fromOrigin(borderRadius.bottomLeft),
        );

  @override
  List<AppRadius> get _properties =>
      [topLeft, topRight, bottomRight, bottomLeft];

  @override
  BorderRadius compute(BuildContext? context, BoxConstraints? constraints) {
    return BorderRadius.only(
      topLeft: topLeft.compute(context, constraints),
      topRight: topRight.compute(context, constraints),
      bottomRight: bottomRight.compute(context, constraints),
      bottomLeft: bottomLeft.compute(context, constraints),
    );
  }
}

class AppBorderRadiusDirectional extends AppBorderRadiusGeometry {
  static const AppBorderRadiusDirectional zero = AppBorderRadiusDirectional.all(
    AppRadius.zero,
  );

  final AppRadius topStart, topEnd, bottomEnd, bottomStart;

  const AppBorderRadiusDirectional.all(AppRadius radius)
      : this.only(
          bottomStart: radius,
          bottomEnd: radius,
          topStart: radius,
          topEnd: radius,
        );

  AppBorderRadiusDirectional.circular(UnitSize radius)
      : this.all(AppRadius.circular(radius));

  const AppBorderRadiusDirectional.vertical({
    final top = AppRadius.zero,
    final bottom = AppRadius.zero,
  }) : this.only(
          bottomStart: bottom,
          bottomEnd: bottom,
          topStart: top,
          topEnd: top,
        );

  const AppBorderRadiusDirectional.horizontal({
    final start = AppRadius.zero,
    final end = AppRadius.zero,
  }) : this.only(
          bottomStart: start,
          topStart: start,
          bottomEnd: end,
          topEnd: end,
        );

  const AppBorderRadiusDirectional.only({
    this.topStart = AppRadius.zero,
    this.topEnd = AppRadius.zero,
    this.bottomEnd = AppRadius.zero,
    this.bottomStart = AppRadius.zero,
  });

  AppBorderRadiusDirectional.fromOrigin(BorderRadiusDirectional borderRadius)
      : this.only(
          topStart: AppRadius.fromOrigin(borderRadius.topStart),
          topEnd: AppRadius.fromOrigin(borderRadius.topEnd),
          bottomEnd: AppRadius.fromOrigin(borderRadius.bottomEnd),
          bottomStart: AppRadius.fromOrigin(borderRadius.bottomStart),
        );

  @override
  List<AppRadius> get _properties => [topStart, topEnd, bottomEnd, bottomStart];

  @override
  BorderRadiusDirectional compute(
    BuildContext? context,
    BoxConstraints? constraints,
  ) {
    return BorderRadiusDirectional.only(
      topStart: topStart.compute(context, constraints),
      topEnd: topEnd.compute(context, constraints),
      bottomEnd: bottomEnd.compute(context, constraints),
      bottomStart: bottomStart.compute(context, constraints),
    );
  }
}
