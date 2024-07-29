import 'package:flutter/widgets.dart';

import './pixel.dart';
import '../extensions/extensions.dart';

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

  void assertMath(Object value, [String? msg]) {
    assert(
      value.runtimeType == runtimeType || value is UnitSize || value is num,
      msg ??
          "The value passed to use isn't of type $runtimeType, $num nor a $UnitSize.",
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
  bool get isNotZero => value != 0;
  bool get isFinite => value.isFinite;
  bool get isInfinite => value.isInfinite;

  bool get isAddable => isZero || isInfinite;
  bool get isSubtractable => isZero;
  bool get isMultipliable => isZero || isInfinite;
  bool get isDividable => isInfinite;

  bool get logical => value.logical;

  bool _operationable(UnitSize other, Operation op) {
    return switch (op) {
      Operation.add => other.isAddable,
      Operation.subtract => other.isSubtractable,
      Operation.multiply => other.isMultipliable,
      Operation.divide => other.isDividable,
      _ => false,
    };
  }

  bool _doOperationByPixel(Object other, Operation op) {
    return other is UnitSize &&
            (other.runtimeType != runtimeType || _operationable(other, op)) ||
        other is! num;
  }

  UnitSize operator +(Object other) {
    assertMath(other);

    if (!other.logical) return this;
    if (other is UnitSize) {
      if (other.isInfinite) return UnitSize.infinite;
    }

    if (_doOperationByPixel(other, Operation.add)) {
      return Pixel.add(this, other as UnitSize);
    }
    return add(other);
  }

  UnitSize operator -(Object other) {
    assertMath(other);

    if (other is UnitSize) {
      if (other.isZero) return UnitSize.zero;
    }

    if (_doOperationByPixel(other, Operation.subtract)) {
      return Pixel.subtract(this, other as UnitSize);
    }

    return subtract(other);
  }

  UnitSize operator *(Object other) {
    assertMath(other);

    if (other is UnitSize) {
      if (other.isZero) return UnitSize.zero;
      if (other.isInfinite) return UnitSize.infinite;
    }

    if (_doOperationByPixel(other, Operation.multiply)) {
      return Pixel.multiply(this, other as UnitSize);
    }
    return multiply(other);
  }

  UnitSize operator /(Object other) {
    assertMath(other);

    if (other is UnitSize) {
      if (other.isInfinite) return UnitSize.zero;
    }

    if (_doOperationByPixel(other, Operation.divide)) {
      return Pixel.divide(this, other as UnitSize);
    }
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
