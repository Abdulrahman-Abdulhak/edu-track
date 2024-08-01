import 'package:flutter/widgets.dart';

import '../_app_class.dart';
import '../../utils/utils.dart';

class AppSize extends AppClass<Size> {
  static const zero = AppSize(UnitSize.zero, UnitSize.zero);
  static const infinite = AppSize(UnitSize.infinite, UnitSize.infinite);

  final UnitSize width, height;
  const AppSize(this.width, this.height);

  AppSize.copy(AppSize size)
      : width = size.width,
        height = size.height;

  const AppSize.fromHeight(this.height) : width = UnitSize.infinite;

  const AppSize.fromWidth(this.width) : height = UnitSize.infinite;

  const AppSize.fromRadius(UnitSize radius)
      : height = radius * 2,
        width = radius * 2;

  const AppSize.square(UnitSize dimension)
      : height = dimension,
        width = dimension;

  AppSize.fromOrigin(Size size)
      : width = size.width.px,
        height = size.height.px;

  @override
  Size compute(BuildContext? context, BoxConstraints? constraints) {
    return Size(
      width.compute(context, constraints),
      height.compute(context, constraints),
    );
  }

  @override
  bool get needsConstraints => [width, height].needsConstraints;

  @override
  bool get needsContext => [width, height].needsContext;
}
