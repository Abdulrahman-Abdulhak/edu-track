import 'package:flutter/widgets.dart';

import './pixel.dart';
import './operationals.dart';
import '../extensions/extensions.dart';

abstract class UnitSize {
  static const zero = Pixel(0);
  static const infinite = Pixel(double.infinity);

  static Operationals min(UnitSize size1, UnitSize size2) {
    return Operationals.min(size1, size2);
  }

  static Operationals max(UnitSize size1, UnitSize size2) {
    return Operationals.max(size1, size2);
  }

  static Operationals clamp(UnitSize min, UnitSize size, UnitSize max) {
    return Operationals.clamp(min, size, max);
  }

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
  double compute(BuildContext? context, BoxConstraints? constraints);
  bool get needsConstraints;
  bool get needsContext;

  UnitSize add(covariant UnitSize val);
  UnitSize subtract(covariant UnitSize val);
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

  UnitSize operator +(UnitSize other) {
    if (!other.logical) return this;
    if (other.isInfinite) return UnitSize.infinite;

    if (_doOperationByPixel(other, Operation.add)) {
      return Pixel.add(this, other);
    }
    return add(other);
  }

  UnitSize operator -(UnitSize other) {
    if (other.isZero) return UnitSize.zero;

    if (_doOperationByPixel(other, Operation.subtract)) {
      return Pixel.subtract(this, other);
    }

    return subtract(other);
  }

  UnitSize operator *(Object other) {
    assert(other is UnitSize || other is num);

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
    assert(other is UnitSize || other is num);

    if (other is UnitSize && other.isInfinite) return UnitSize.zero;

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
