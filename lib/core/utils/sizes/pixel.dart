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
  Pixel add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const Pixel(double.infinity);

    return Pixel.add(this, val);
  }

  @override
  Pixel divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const Pixel(0);

    if (val is num) {
      return switch (_op) {
        Operation.none => Pixel(value / val),
        Operation.add => Pixel.add(_sizes.first / val, _sizes.last / val),
        Operation.subtract => Pixel.subtract(
            _sizes.first / val,
            _sizes.last / val,
          ),
        Operation.multiply => Pixel.multiply(_sizes.first / val, _sizes.last),
        Operation.divide => Pixel.divide(_sizes.first / val, _sizes.last),
      };
    }
    if (val is UnitSize) return Pixel.divide(this, val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  Pixel multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const Pixel(0);
      if (val.isInfinite) return const Pixel(double.infinity);
    }

    if (val is num) {
      return switch (_op) {
        Operation.none => Pixel(value * val),
        Operation.add => Pixel.add(_sizes.first * val, _sizes.last * val),
        Operation.subtract => Pixel.subtract(
            _sizes.first * val,
            _sizes.last * val,
          ),
        Operation.multiply => Pixel.multiply(_sizes.first * val, _sizes.last),
        Operation.divide => Pixel.divide(_sizes.first * val, _sizes.last),
      };
    }
    if (val is UnitSize) return Pixel.multiply(this, val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  Pixel subtract(UnitSize val) {
    if (val.isZero) return this;
    return Pixel.subtract(this, val);
  }

  @override
  String toString() {
    return switch (_op) {
      Operation.none => "Pixel($value)",
      Operation.add => "Add(${_sizes.first}, ${_sizes.last})",
      Operation.subtract => "Subtract(${_sizes.first}, ${_sizes.last})",
      Operation.multiply => "Multiply(${_sizes.first}, ${_sizes.last})",
      Operation.divide => "Divide(${_sizes.first}, ${_sizes.last})",
    };
  }
}
