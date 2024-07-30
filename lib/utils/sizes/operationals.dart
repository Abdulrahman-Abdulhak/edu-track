import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/widgets.dart';

import './pixel.dart';
import './unit_size.dart';
import '../extensions/extensions.dart';

abstract class Operationals extends UnitSize {
  static Operationals min(UnitSize size1, UnitSize size2) {
    return _Min(size1, size2);
  }

  static Operationals max(UnitSize size1, UnitSize size2) {
    return _Max(size1, size2);
  }

  static Operationals clamp(UnitSize min, UnitSize size, UnitSize max) {
    return _Clamp(min, size, max);
  }

  const Operationals() : super(double.nan);

  UnitSize currentValue(BuildContext? context, BoxConstraints? constraints);

  @override
  Pixel add(UnitSize val) {
    return Pixel.add(this, val);
  }

  @override
  UnitSize divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isInfinite) return UnitSize.zero;
      return Pixel.divide(this, val);
    }

    if (val is num) return _divide(val);
    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  Operationals _divide(num val);

  @override
  UnitSize multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return UnitSize.zero;
      if (val.isInfinite) return UnitSize.infinite;
      return Pixel.multiply(this, val);
    }

    if (val is num) return _multiply(val);
    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  Operationals _multiply(num val);

  @override
  Pixel subtract(UnitSize val) {
    return Pixel.subtract(this, val);
  }
}

class _Min extends Operationals {
  final UnitSize size1, size2;
  const _Min(this.size1, this.size2) : super();

  @override
  UnitSize currentValue(BuildContext? context, BoxConstraints? constraints) {
    final value1 = size1.compute(context, constraints);
    final value2 = size2.compute(context, constraints);

    final min = math.min(value1, value2);
    return min == value1 ? size1 : size2;
  }

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    final min = math.min(
      size1.compute(context, constraints),
      size2.compute(context, constraints),
    );

    return min;
  }

  @override
  bool get needsConstraints => [size1, size2].needsConstraints;

  @override
  bool get needsContext => [size1, size2].needsContext;

  @override
  _Min _divide(num val) => _Min(size1.divide(val), size2.divide(val));

  @override
  _Min _multiply(num val) => _Min(size1.multiply(val), size2.multiply(val));
}

class _Max extends Operationals {
  final UnitSize size1, size2;
  const _Max(this.size1, this.size2) : super();

  @override
  UnitSize currentValue(BuildContext? context, BoxConstraints? constraints) {
    final value1 = size1.compute(context, constraints);
    final value2 = size2.compute(context, constraints);

    final max = math.max(value1, value2);
    return max == value1 ? size1 : size2;
  }

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    final max = math.max(
      size1.compute(context, constraints),
      size2.compute(context, constraints),
    );

    return max;
  }

  @override
  bool get needsConstraints => [size1, size2].needsConstraints;

  @override
  bool get needsContext => [size1, size2].needsContext;

  @override
  _Max _divide(num val) => _Max(size1.divide(val), size2.divide(val));

  @override
  _Max _multiply(num val) => _Max(size1.multiply(val), size2.multiply(val));
}

class _Clamp extends Operationals {
  final UnitSize min, size, max;
  const _Clamp(this.min, this.size, this.max) : super();

  @override
  UnitSize currentValue(BuildContext? context, BoxConstraints? constraints) {
    final min = this.min.compute(context, constraints);
    final value = size.compute(context, constraints);
    final max = this.max.compute(context, constraints);

    final clamp = clampDouble(value, min, max);

    if (clamp == min) return this.min;
    if (clamp == max) return this.max;

    return size;
  }

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    final clamp = clampDouble(
      size.compute(context, constraints),
      min.compute(context, constraints),
      max.compute(context, constraints),
    );

    return clamp;
  }

  @override
  bool get needsConstraints => [min, size, max].needsConstraints;

  @override
  bool get needsContext => [min, size, max].needsContext;

  @override
  _Clamp _divide(num val) {
    return _Clamp(min.divide(val), size.divide(val), max.divide(val));
  }

  @override
  _Clamp _multiply(num val) {
    return _Clamp(min.multiply(val), size.multiply(val), max.multiply(val));
  }
}
