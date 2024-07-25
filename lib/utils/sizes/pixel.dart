import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents the size of 1 pixel.
class Pixel extends Size {
  Pixel(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    return value;
  }
}
