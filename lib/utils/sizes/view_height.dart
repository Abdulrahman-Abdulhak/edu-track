import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents 1% of the screen's height.
class ViewHeight extends UnitSize {
  const ViewHeight(super.value);

  @override
  double compute([BuildContext? context, BoxConstraints? constraints]) {
    assertCompute(context, constraints);

    final screenHeight = MediaQuery.of(context!).size.height;
    return value * screenHeight / 100;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;
}
