import 'dart:math';

import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the maximum value defined in the parent widget's
//* size (constraints). it is either the width or the height.
class ContainerMax extends UnitSize {
  const ContainerMax(super.value);

  @override
  double compute([BuildContext? context, BoxConstraints? constraints]) {
    assertCompute(context, constraints);

    //TODO: make it able to find size of the first parent that have a finite size

    final screenSize = MediaQuery.of(context!).size;
    final maxSize = max(constraints!.maxWidth, constraints.maxHeight);

    final containerMax = maxSize.isFinite ? maxSize : screenSize.width;

    return value * containerMax / 100;
  }

  @override
  bool get needsConstraints => true;

  @override
  bool get needsContext => true;
}
