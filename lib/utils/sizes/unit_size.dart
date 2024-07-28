import 'package:flutter/widgets.dart';

import './pixel.dart';

abstract class UnitSize {
  static const zero = Pixel(0);
  static const infinite = Pixel(double.infinity);

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

  void assertMath(
    Object value,
    Type type, [
    String? msg,
  ]) {
    assert(
      value.runtimeType == type || value is num,
      "The value passed to use isn't of type $type nor $num",
    );
  }

  Pixel toPixel(BuildContext? context, BoxConstraints? constraints) {
    return Pixel(compute(context, constraints));
  }

  //* this function is computing the value passed as parameter to original
  //* size unit used in flutter.
  double compute(BuildContext? context, BoxConstraints? constraints);
  bool get needsConstraints;
  bool get needsContext;

  UnitSize add(Object val);
  UnitSize subtract(Object val);
  UnitSize multiply(Object val);
  UnitSize divide(Object val);

  bool get isZero => value == 0;

  UnitSize operator +(Object other) {
    assertMath(other, UnitSize);

    if (other is UnitSize) return Pixel.add(this, other);
    return add(other);
  }

  UnitSize operator -(Object other) {
    assertMath(other, UnitSize);

    if (other is UnitSize) return Pixel.subtract(this, other);
    return subtract(other);
  }

  UnitSize operator *(Object other) {
    assertMath(other, UnitSize);

    if (other is UnitSize) return Pixel.multiply(this, other);
    return multiply(other);
  }

  UnitSize operator /(Object other) {
    assertMath(other, UnitSize);

    if (other is UnitSize) return Pixel.divide(this, other);
    return divide(other);
  }

  @override
  bool operator ==(Object other) {
    if (other is! UnitSize) return false;

    if (isZero && other.isZero) return true;
    return runtimeType == other.runtimeType && value == other.value;
  }

  @override
  int get hashCode => Object.hash(value, runtimeType);
}
