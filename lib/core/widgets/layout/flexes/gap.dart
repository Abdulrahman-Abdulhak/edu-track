import 'package:flutter/material.dart';

import '../wrappers/wrappers.dart';
import '../../../utils/utils.dart';

class Gap extends StatelessWidget {
  final Axis direction;
  final UnitSize size;

  const Gap({
    super.key,
    required this.direction,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) return AppSizedBox(width: size);
    return AppSizedBox(height: size);
  }
}
