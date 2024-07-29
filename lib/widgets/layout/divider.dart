import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';

import './flexes/flexes.dart';

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
      gap: gap,
      children: [
        divider,
        label!,
        divider,
      ],
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [indent, endIndent, height, thickness, gap].needsConstraints;
  }
}
