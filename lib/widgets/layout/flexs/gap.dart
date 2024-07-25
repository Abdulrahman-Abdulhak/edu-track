import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/sizes/sizes.dart';

class Gap extends AppStatelessWidget {
  final Axis direction;
  final UnitSize size;

  const Gap({
    super.key,
    required this.direction,
    required this.size,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    if (direction == Axis.horizontal) {
      return SizedBox(width: size.compute(context, constraints));
    }

    return SizedBox(height: size.compute(context, constraints));
  }

  @override
  bool needsConstraints(BuildContext context) => size.needsConstraints;
}
