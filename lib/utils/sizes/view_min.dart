import 'dart:math';

import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents 1% of the minimum value defined in the screen's size.
//* it is either the width or the height.
class ViewMin extends Size {
  ViewMin(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    assert(context != null);

    final screenSize = MediaQuery.of(context!).size;
    final screenMin = min(screenSize.height, screenSize.width);

    return value * screenMin / 100;
  }
}
