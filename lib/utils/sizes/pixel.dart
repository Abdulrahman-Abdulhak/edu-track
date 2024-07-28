import 'package:flutter/widgets.dart';

import 'unit_size.dart';

enum _operation {
  add,
  multiply,
  subtract,
  divide,
  none;
}

//* this class represents the size of 1 pixel.
class Pixel extends UnitSize {
  final _operation _op;
  final List<UnitSize> _sizes;

  const Pixel(super.value)
      : _op = _operation.none,
        _sizes = const [];

  Pixel.add(UnitSize size1, UnitSize size2)
      : _op = _operation.add,
        _sizes = [size1, size2],
        super(0);

  Pixel.multiply(UnitSize size1, UnitSize size2)
      : _op = _operation.multiply,
        _sizes = [size1, size2],
        super(0);

  Pixel.subtract(UnitSize size1, UnitSize size2)
      : _op = _operation.subtract,
        _sizes = [size1, size2],
        super(0);

  Pixel.divide(UnitSize size1, UnitSize size2)
      : _op = _operation.divide,
        _sizes = [size1, size2],
        super(0);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    double result = 0;

    if (_sizes.isNotEmpty) {
      result = _sizes.first.compute(context, constraints);
      result = switch (_op) {
        _operation.add => result + _sizes.last.compute(context, constraints),
        _operation.multiply =>
          result * _sizes.last.compute(context, constraints),
        _operation.divide => result / _sizes.last.compute(context, constraints),
        _operation.subtract =>
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
    assertMath(val, Pixel);

    if (val is Pixel) return Pixel(value + val.value);
    return Pixel(value + (val as num));
  }

  @override
  Pixel divide(Object val) {
    assertMath(val, Pixel);

    if (val is Pixel) return Pixel(value / val.value);
    return Pixel(value / (val as num));
  }

  @override
  Pixel multiply(Object val) {
    assertMath(val, Pixel);

    if (val is Pixel) return Pixel(value * val.value);
    return Pixel(value * (val as num));
  }

  @override
  Pixel subtract(Object val) {
    assertMath(val, Pixel);

    if (val is Pixel) return Pixel(value - val.value);
    return Pixel(value - (val as num));
  }
}
