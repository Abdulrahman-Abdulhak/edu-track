import 'package:flutter/widgets.dart';

import 'package:edu_track/utils/utils.dart';

import '../../_app_class.dart';
import '../coordinate/coordinate.dart';

class AppShadow implements AppClass<Shadow> {
  static const _defaultColor = Color(0xFF000000);

  final UnitSize blurRadius;
  final AppOffset offset;
  final Color color;

  const AppShadow({
    this.blurRadius = UnitSize.zero,
    this.offset = AppOffset.zero,
    this.color = _defaultColor,
  });

  AppShadow.fromOrigin(Shadow shadow)
      : blurRadius = shadow.blurRadius.px,
        offset = AppOffset.fromOrigin(shadow.offset),
        color = shadow.color;

  @override
  Shadow compute(BuildContext? context, BoxConstraints? constraints) {
    return Shadow(
      blurRadius: blurRadius.compute(context, constraints),
      offset: offset.compute(context, constraints),
      color: color,
    );
  }

  @override
  bool get needsConstraints =>
      blurRadius.needsConstraints || offset.needsConstraints;

  @override
  bool get needsContext => blurRadius.needsContext || offset.needsContext;
}

class AppBoxShadow extends AppShadow {
  final UnitSize spreadRadius;
  final BlurStyle blurStyle;

  const AppBoxShadow({
    super.blurRadius,
    super.offset,
    super.color,
    this.spreadRadius = UnitSize.zero,
    this.blurStyle = BlurStyle.normal,
  });

  AppBoxShadow.fromOrigin(BoxShadow shadow)
      : spreadRadius = shadow.spreadRadius.px,
        blurStyle = shadow.blurStyle,
        super(
          blurRadius: shadow.blurRadius.px,
          offset: AppOffset.fromOrigin(shadow.offset),
          color: shadow.color,
        );

  @override
  BoxShadow compute(BuildContext? context, BoxConstraints? constraints) {
    return BoxShadow(
      blurRadius: blurRadius.compute(context, constraints),
      spreadRadius: spreadRadius.compute(context, constraints),
      offset: offset.compute(context, constraints),
      blurStyle: blurStyle,
      color: color,
    );
  }

  @override
  bool get needsConstraints =>
      spreadRadius.needsConstraints || super.needsConstraints;

  @override
  bool get needsContext => spreadRadius.needsContext || super.needsContext;
}
