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
  Rem add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const Rem(double.infinity);

    if (val is Rem) return Rem(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  Rem divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const Rem(0);

    if (val is Rem) return Rem(value / val.value);
    if (val is num) return Rem(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  Rem multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const Rem(0);
      if (val.isInfinite) return const Rem(double.infinity);
    }

    if (val is Rem) return Rem(value * val.value);
    if (val is num) return Rem(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  Rem subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is Rem) return Rem(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }

  @override
  String toString() {
    return "Rem($value)";
  }
}
