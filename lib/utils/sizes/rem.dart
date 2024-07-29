import 'package:flutter/widgets.dart';

import 'unit_size.dart';

//* this class represents the font size used for the application at the start.
//* usually 16 pixels.
class Rem extends UnitSize {
  const Rem(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    //TODO: try to get the real value of the app's set root font size.
    final rootFontSize = 16;
    return value * rootFontSize;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => false;

  @override
  Rem add(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return this;
      if (val.isInfinite) return const Rem(double.infinity);
    }

    if (val is Rem) return Rem(value + val.value);
    return Rem(value + (val as num));
  }

  @override
  Rem divide(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isInfinite) return const Rem(0);
    }

    if (val is Rem) return Rem(value / val.value);
    return Rem(value / (val as num));
  }

  @override
  Rem multiply(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return const Rem(0);
      if (val.isInfinite) return const Rem(double.infinity);
    }

    if (val is Rem) return Rem(value * val.value);
    return Rem(value * (val as num));
  }

  @override
  Rem subtract(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return this;
    }

    if (val is Rem) return Rem(value - val.value);
    return Rem(value - (val as num));
  }
}
