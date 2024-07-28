import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the parent widget's width.
class ContainerWidth extends UnitSize {
  const ContainerWidth(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    //TODO: make it able to find size of the first parent that have a finite size

    final screenSize = MediaQuery.of(context!).size;
    final maxWidth = constraints!.maxWidth;

    final containerWidth = maxWidth.isFinite ? maxWidth : screenSize.width;

    return value * containerWidth / 100;
  }

  @override
  bool get needsConstraints => true;

  @override
  bool get needsContext => true;

  @override
  ContainerWidth add(Object val) {
    assertMath(val, ContainerWidth);

    if (val is ContainerWidth) return ContainerWidth(value + val.value);
    return ContainerWidth(value + (val as num));
  }

  @override
  ContainerWidth divide(Object val) {
    assertMath(val, ContainerWidth);

    if (val is ContainerWidth) return ContainerWidth(value / val.value);
    return ContainerWidth(value / (val as num));
  }

  @override
  ContainerWidth multiply(Object val) {
    assertMath(val, ContainerWidth);

    if (val is ContainerWidth) return ContainerWidth(value * val.value);
    return ContainerWidth(value * (val as num));
  }

  @override
  ContainerWidth subtract(Object val) {
    assertMath(val, ContainerWidth);

    if (val is ContainerWidth) return ContainerWidth(value - val.value);
    return ContainerWidth(value - (val as num));
  }
}
