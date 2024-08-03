import 'package:flutter/material.dart';

import './flexes/flexes.dart';
import '../../_main/main.dart';
import '../../utils/utils.dart';

//* new divider class capable of creating a divider with a label in
//* the center of it. such as:
//* --------------- OR ---------------
class AppDivider extends AppStatelessWidget {
  final UnitSize? indent, endIndent, height, thickness;

  final Color? color;
  final Widget? label;

  final UnitSize gap;

  const AppDivider({
    super.key,
    this.indent,
    this.endIndent,
    this.height,
    this.thickness,
    this.color,
    this.label,
    this.gap = const Rem(.5),
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final divider = Divider(
      indent: indent?.compute(context, constraints),
      endIndent: endIndent?.compute(context, constraints),
      height: height?.compute(context, constraints),
      thickness: thickness?.compute(context, constraints),
      color: color,
    );

    if (label == null) return divider;
    return AppRow(
      mainAxisSize: MainAxisSize.max,
      gap: gap,
      children: [
        Expanded(child: divider),
        label!,
        Expanded(child: divider),
      ],
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [indent, endIndent, height, thickness, gap].needsConstraints;
  }
}
