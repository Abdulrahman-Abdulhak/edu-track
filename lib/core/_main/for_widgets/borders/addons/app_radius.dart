import 'package:flutter/widgets.dart';

import '../../../_app_class.dart';
import '../../../../utils/utils.dart';

class AppRadius implements AppClass<Radius> {
  static const zero = AppRadius.circular(UnitSize.zero);

  final UnitSize x, y;

  const AppRadius.elliptical(this.x, this.y);

  const AppRadius.circular(UnitSize radius) : this.elliptical(radius, radius);

  AppRadius.fromOrigin(Radius radius)
      : this.elliptical(Pixel(radius.x), Pixel(radius.y));

  @override
  Radius compute(BuildContext? context, BoxConstraints? constraints) {
    return Radius.elliptical(
      x.compute(context, constraints),
      y.compute(context, constraints),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [x, y].needsConstraints;
  }

  @override
  bool get needsContext => [x, y].needsContext;
}
