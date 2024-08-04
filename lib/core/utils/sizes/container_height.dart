import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the parent widget's height.
class ContainerHeight extends UnitSize {
  const ContainerHeight(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
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
  ContainerHeight add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const ContainerHeight(double.infinity);

    if (val is ContainerHeight) return ContainerHeight(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ContainerHeight divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const ContainerHeight(0);

    if (val is ContainerHeight) return ContainerHeight(value / val.value);
    if (val is num) return ContainerHeight(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  ContainerHeight multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const ContainerHeight(0);
      if (val.isInfinite) return const ContainerHeight(double.infinity);
    }

    if (val is ContainerHeight) return ContainerHeight(value * val.value);
    if (val is num) return ContainerHeight(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  ContainerHeight subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is ContainerHeight) return ContainerHeight(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }

  @override
  String toString() {
    return "ContainerHeight($value)";
  }
}
