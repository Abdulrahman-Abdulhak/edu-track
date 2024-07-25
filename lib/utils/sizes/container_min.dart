import 'dart:math';

import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents 1% of the minimum value defined in the parent widget's
//* size (constraints). it is either the width or the height.
class ContainerMin extends Size {
  ContainerMin(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    assert(context != null);

    //TODO: make it able to find size of the first parent that have a finite size

    final screenSize = MediaQuery.of(context!).size;
    final minSize = min(constraints!.minWidth, constraints.minHeight);

    final containerMin = minSize.isFinite ? minSize : screenSize.width;

    return value * containerMin / 100;
  }
}
