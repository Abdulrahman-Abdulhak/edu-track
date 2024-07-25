import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents 1% of the parent widget's height.
class ContainerHeight extends Size {
  ContainerHeight(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    assert(context != null && constraints != null);

    //TODO: make it able to find size of the first parent that have a finite size

    final screenSize = MediaQuery.of(context!).size;
    final maxHeight = constraints!.maxHeight;

    final containerHeight = maxHeight.isFinite ? maxHeight : screenSize.height;

    return value * containerHeight / 100;
  }
}
