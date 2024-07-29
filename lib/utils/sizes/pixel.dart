import 'package:flutter/widgets.dart';

import 'unit_size.dart';

enum Operation {
  add,
  multiply,
  subtract,
  divide,
  none;
}

//* this class represents the size of 1 pixel.
class Pixel extends UnitSize {
  final Operation _op;
  final List<UnitSize> _sizes;

  const Pixel(super.value)
      : _op = Operation.none,
        _sizes = const [];

  Pixel.add(UnitSize size1, UnitSize size2)
      : _op = Operation.add,
        _sizes = [size1, size2],
        super(0);

  Pixel.multiply(UnitSize size1, UnitSize size2)
      : _op = Operation.multiply,
        _sizes = [size1, size2],
        super(0);

  Pixel.subtract(UnitSize size1, UnitSize size2)
      : _op = Operation.subtract,
        _sizes = [size1, size2],
        super(0);

  Pixel.divide(UnitSize size1, UnitSize size2)
      : _op = Operation.divide,
        _sizes = [size1, size2],
        super(0);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    double result = 0;

    if (_sizes.isNotEmpty) {
      result = _sizes.first.compute(context, constraints);
      result = switch (_op) {
        Operation.add => result + _sizes.last.compute(context, constraints),
        Operation.multiply =>
          result * _sizes.last.compute(context, constraints),
        Operation.divide => result / _sizes.last.compute(context, constraints),
        Operation.subtract =>
          result - _sizes.last.compute(context, constraints),
        _ => result,
      };
    }

    return value + result;
  }

  @override
  bool get needsConstraints => UnitSize.anyNeedsConstraints(_sizes);

  @override
  bool get needsContext => UnitSize.anyNeedsContext(_sizes);

  @override
  Pixel add(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return this;
      if (val.isInfinite) return const Pixel(double.infinity);
    }

    if (val is Pixel) return Pixel(value + val.value);
    return Pixel(value + (val as num));
  }

  @override
  Pixel divide(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isInfinite) return const Pixel(0);
    }

    if (val is Pixel) return Pixel(value / val.value);
    return Pixel(value / (val as num));
  }

  @override
  Pixel multiply(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return const Pixel(0);
      if (val.isInfinite) return const Pixel(double.infinity);
    }

    if (val is Pixel) return Pixel(value * val.value);
    return Pixel(value * (val as num));
  }

  @override
  Pixel subtract(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return this;
    }

    if (val is Pixel) return Pixel(value - val.value);
    return Pixel(value - (val as num));
  }
}
