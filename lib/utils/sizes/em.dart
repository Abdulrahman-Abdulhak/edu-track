import 'package:flutter/widgets.dart';

import 'package:edu_track/widgets/widgets.dart';

import 'unit_size.dart';

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
  Em add(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return this;
      if (val.isInfinite) return const Em(double.infinity);
    }

    if (val is Em) return Em(value + val.value);
    return Em(value + (val as num));
  }

  @override
  Em divide(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isInfinite) return const Em(0);
    }

    if (val is Em) return Em(value / val.value);
    return Em(value / (val as num));
  }

  @override
  Em multiply(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return const Em(0);
      if (val.isInfinite) return const Em(double.infinity);
    }

    if (val is Em) return Em(value * val.value);
    return Em(value * (val as num));
  }

  @override
  Em subtract(Object val) {
    assertMath(val);

    if (val is UnitSize) {
      if (val.isZero) return this;
    }

    if (val is Em) return Em(value - val.value);
    return Em(value - (val as num));
  }
}
