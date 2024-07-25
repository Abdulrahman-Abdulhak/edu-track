import 'package:flutter/widgets.dart';

import './pixel.dart';

abstract class UnitSize {
  final double value;
  const UnitSize(this.value);

  //* this function is computing the value passed as parameter to original
  //* size unit used in flutter.
  double compute([BuildContext? context, BoxConstraints? constraints]);
  bool get needsConstraints;
  bool get needsContext;

  void assertCompute(
    BuildContext? context,
    BoxConstraints? constraints, [
    String? msg,
  ]) {
    if (needsConstraints && needsContext) {
      assert(context != null && constraints != null, msg);
    } else if (needsContext) {
      assert(context != null, msg);
    } else if (needsConstraints) {
      assert(constraints != null, msg);
    }
  }

  Pixel toPixel(BuildContext? context, BoxConstraints? constraints) {
    return Pixel(compute(context, constraints));
  }
}
