import 'package:flutter/widgets.dart';

import './unit_size.dart';
import '../../widgets/widgets.dart';

//* this class represents the last font size set for the current context.
class Em extends UnitSize {
  const Em(super.value);

  @override
  double compute(BuildContext? context, BoxConstraints? constraints) {
    assertCompute(context, constraints);

    final previousFontSize =
        AppDefaultTextStyle.of(context!).style.fontSize!.compute(
              context,
              constraints,
            );

    return value * previousFontSize;
  }

  @override
  bool get needsConstraints => false;

  @override
  bool get needsContext => true;

  @override
  Em add(UnitSize val) {
    if (val.isZero) return this;
    if (val.isInfinite) return const Em(double.infinity);

    if (val is Em) return Em(value + val.value);

    throw "invalid value to add. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  Em divide(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize && val.isInfinite) return const Em(0);

    if (val is Em) return Em(value / val.value);
    if (val is num) return Em(value / val);

    throw "invalid value to divide. (only infinite UnitSize and $runtimeType are allowed)";
  }

  @override
  Em multiply(Object val) {
    assert(val is UnitSize || val is num);

    if (val is UnitSize) {
      if (val.isZero) return const Em(0);
      if (val.isInfinite) return const Em(double.infinity);
    }

    if (val is Em) return Em(value * val.value);
    if (val is num) return Em(value * val);

    throw "invalid value to multiply. (only zero and infinite UnitSizes and $runtimeType are allowed)";
  }

  @override
  Em subtract(UnitSize val) {
    if (val.isZero) return this;

    if (val is Em) return Em(value - val.value);
    throw "invalid value to subtract. (only zero UnitSize and $runtimeType are allowed)";
  }

  @override
  String toString() {
    return "Em($value)";
  }
}
