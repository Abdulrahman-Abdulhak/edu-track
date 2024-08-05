import 'package:flutter/material.dart';

import '../../../_main/main.dart';
import '../../../utils/utils.dart';

class AppPositioned extends AppStatelessWidget {
  final UnitSize? width, height, left, top, right, bottom;
  final int? zIndex;

  final Widget child;

  const AppPositioned({
    super.key,
    this.zIndex,
    this.width,
    this.height,
    this.left,
    this.top,
    this.right,
    this.bottom,
    required this.child,
  });

  @override
  Widget compute(BuildContext context, BoxConstraints? constraints) {
    return Positioned(
      width: width?.compute(context, constraints),
      height: height?.compute(context, constraints),
      left: left?.compute(context, constraints),
      top: top?.compute(context, constraints),
      right: right?.compute(context, constraints),
      bottom: bottom?.compute(context, constraints),
      child: child,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [width, height, left, top, right, bottom].needsConstraints;
  }
}
