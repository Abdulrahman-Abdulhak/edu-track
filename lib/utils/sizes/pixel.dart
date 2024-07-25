import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents the size of 1 pixel.
class Pixel extends UnitSize {
  const Pixel(super.value);

  @override
  double compute([BuildContext? context, BoxConstraints? constraints]) {
    return value;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => false;
}
