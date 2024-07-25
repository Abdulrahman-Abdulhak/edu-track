import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents 1% of the screen's height.
class ViewHeight extends Size {
  ViewHeight(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    assert(context != null);

    final screenHeight = MediaQuery.of(context!).size.height;
    return value * screenHeight / 100;
  }
}
