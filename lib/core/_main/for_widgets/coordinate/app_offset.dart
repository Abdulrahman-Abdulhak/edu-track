import 'dart:math';

import 'package:flutter/widgets.dart';

import '../../_app_class.dart';
import '../../../utils/utils.dart';

class AppOffset extends AppClass<Offset> {
  static const zero = AppOffset(UnitSize.zero, UnitSize.zero);
  static const infinite = AppOffset(UnitSize.infinite, UnitSize.infinite);

  final UnitSize dx, dy;
  const AppOffset(this.dx, this.dy);

  factory AppOffset.fromDirection(
    double direction, [
    UnitSize distance = const Pixel(1),
  ]) {
    return AppOffset(distance * cos(direction), distance * sin(direction));
  }

  AppOffset.fromOrigin(Offset offset)
      : dx = offset.dx.px,
        dy = offset.dy.px;

  @override
  Offset compute(BuildContext? context, BoxConstraints? constraints) {
    return Offset(
      dx.compute(context, constraints),
      dy.compute(context, constraints),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [dx, dy].needsConstraints;
  }

  @override
  bool get needsContext => [dx, dy].needsContext;
}
