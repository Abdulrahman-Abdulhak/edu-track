import 'package:flutter/widgets.dart';

import './size.dart';

//* this class represents the last font size set for the current context.
class Em extends Size {
  Em(super.value);

  @override
  double compute({BuildContext? context, BoxConstraints? constraints}) {
    //TODO: try to get the real value of the latest set font size in the prent widgets.
    final previousFontSize = 16;
    return value * previousFontSize;
  }
}
