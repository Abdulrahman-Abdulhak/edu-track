import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents 1% of the screen's width.
class ViewWidth extends Size {
  ViewWidth(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    assert(context != null);

    final screenWidth = MediaQuery.of(context!).size.width;
    return value * screenWidth / 100;
  }
}
