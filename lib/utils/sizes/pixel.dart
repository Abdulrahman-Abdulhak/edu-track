import 'package:flutter/widgets.dart';

import 'unit_size.dart';

enum _operation {
  add,
  mult,
  sub,
  div,
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

  Pixel.mult(UnitSize size1, UnitSize size2)
      : _op = _operation.mult,
        _sizes = [size1, size2],
        super(0);

  Pixel.sub(UnitSize size1, UnitSize size2)
      : _op = _operation.sub,
        _sizes = [size1, size2],
        super(0);

  Pixel.div(UnitSize size1, UnitSize size2)
      : _op = _operation.div,
        _sizes = [size1, size2],
        super(0);

  @override
  double compute([BuildContext? context, BoxConstraints? constraints]) {
    double result = 0;

    if (_sizes.isNotEmpty) {
      result = _sizes.first.compute(context, constraints);
      result = switch (_op) {
        _operation.add => result + _sizes.last.compute(context, constraints),
        _operation.mult => result * _sizes.last.compute(context, constraints),
        _operation.div => result / _sizes.last.compute(context, constraints),
        _operation.sub => result - _sizes.last.compute(context, constraints),
        _ => result,
      };
    }

    return value + result;
  }

  @override
  bool get needsConstraints => UnitSize.anyNeedsConstraints(_sizes);

  @override
  bool get needsContext => UnitSize.anyNeedsContext(_sizes);
}
