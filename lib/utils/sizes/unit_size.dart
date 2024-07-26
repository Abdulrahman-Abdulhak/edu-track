import 'package:flutter/widgets.dart';

import './pixel.dart';

abstract class UnitSize {
  static const zero = Pixel(0);

  static bool anyNeedsConstraints(List<UnitSize?> sizes) {
    return sizes.any((size) => size != null && size.needsConstraints);
  }

  static bool anyNeedsContext(List<UnitSize?> sizes) {
    return sizes.any((size) => size != null && size.needsContext);
  }

  final double value;
  const UnitSize(this.value);

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

  //* this function is computing the value passed as parameter to original
  //* size unit used in flutter.
  double compute([BuildContext? context, BoxConstraints? constraints]);
  bool get needsConstraints;
  bool get needsContext;

  Pixel operator +(covariant UnitSize other) => Pixel.add(this, other);
  Pixel operator *(covariant UnitSize other) => Pixel.mult(this, other);
  Pixel operator -(covariant UnitSize other) => Pixel.sub(this, other);
  Pixel operator /(covariant UnitSize other) => Pixel.div(this, other);
}
