import 'package:edu_track/utils/utils.dart';
import 'package:flutter/material.dart';

import './flexes/flexes.dart';

//* new divider class capable of creating a divider with a label in
//* the center of it. such as:
//* --------------- OR ---------------
class AppDivider extends Divider {
  final Widget? label;

  final UnitSize gap;

  const AppDivider({
    super.key,
    super.color,
    super.indent,
    super.endIndent,
    super.height,
    super.thickness,
    this.label,
    this.gap = const Rem(.5),
  });

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return super.build(context);
    }

    return AppRow(
      gap: gap,
      children: [
        Expanded(child: super.build(context)),
        label!,
        Expanded(child: super.build(context)),
      ],
    );
  }
}
