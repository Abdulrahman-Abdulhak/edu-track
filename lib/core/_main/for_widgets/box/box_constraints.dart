import 'package:flutter/widgets.dart';

import '../../_app_class.dart';
import '../../../utils/utils.dart';

class AppBoxConstraints implements AppClass<BoxConstraints> {
  final UnitSize minWidth, maxWidth, minHeight, maxHeight;

  const AppBoxConstraints({
    this.minWidth = UnitSize.zero,
    this.maxWidth = UnitSize.infinite,
    this.minHeight = UnitSize.zero,
    this.maxHeight = UnitSize.infinite,
  });

  AppBoxConstraints.fromOrigin(BoxConstraints constraints)
      : minWidth = Pixel(constraints.minWidth),
        maxWidth = Pixel(constraints.maxWidth),
        minHeight = Pixel(constraints.minHeight),
        maxHeight = Pixel(constraints.maxHeight);

  @override
  BoxConstraints compute(BuildContext? context, BoxConstraints? constraints) {
    return BoxConstraints(
      minWidth: minWidth.compute(context, constraints),
      maxWidth: maxWidth.compute(context, constraints),
      minHeight: minHeight.compute(context, constraints),
      maxHeight: maxHeight.compute(context, constraints),
    );
  }

  @override
  bool get needsConstraints => [
        minWidth,
        maxWidth,
        minHeight,
        maxHeight,
      ].needsConstraints;

  @override
  bool get needsContext => [
        minWidth,
        maxWidth,
        minHeight,
        maxHeight,
      ].needsContext;
}
