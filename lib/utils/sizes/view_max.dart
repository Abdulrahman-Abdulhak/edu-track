import 'dart:math';

import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents 1% of the maximum value defined in the screen's size.
//* it is either the width or the height.
class ViewMax extends Size {
  ViewMax(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    assert(context != null);

    final screenSize = MediaQuery.of(context!).size;
    final screenMax = max(screenSize.height, screenSize.width);

    return value * screenMax / 100;
  }
}
