import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents the font size used for the application at the start.
//* usually 16 pixels.
class Rem extends Size {
  Rem(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    //TODO: try to get the real value of the app's set root font size.
    final rootFontSize = 16;
    return value * rootFontSize;
  }
}
