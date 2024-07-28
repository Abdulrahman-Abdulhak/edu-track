import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the parent widget's height.
class ContainerHeight extends UnitSize {
  const ContainerHeight(super.value);

  @override
  double compute([BuildContext? context, BoxConstraints? constraints]) {
    assertCompute(context, constraints);

    //TODO: make it able to find size of the first parent that have a finite size

    final screenSize = MediaQuery.of(context!).size;
    final maxHeight = constraints!.maxHeight;

    final containerHeight = maxHeight.isFinite ? maxHeight : screenSize.height;

    return value * containerHeight / 100;
  }

  @override
  bool get needsConstraints => true;

  @override
  bool get needsContext => true;

  @override
  ContainerHeight add(Object val) {
    assertMath(val, ContainerHeight);

    if (val is ContainerHeight) return ContainerHeight(value + val.value);
    return ContainerHeight(value + (val as num));
  }

  @override
  ContainerHeight divide(Object val) {
    assertMath(val, ContainerHeight);

    if (val is ContainerHeight) return ContainerHeight(value / val.value);
    return ContainerHeight(value / (val as num));
  }

  @override
  ContainerHeight multiply(Object val) {
    assertMath(val, ContainerHeight);

    if (val is ContainerHeight) return ContainerHeight(value * val.value);
    return ContainerHeight(value * (val as num));
  }

  @override
  ContainerHeight subtract(Object val) {
    assertMath(val, ContainerHeight);

    if (val is ContainerHeight) return ContainerHeight(value - val.value);
    return ContainerHeight(value - (val as num));
  }
}
