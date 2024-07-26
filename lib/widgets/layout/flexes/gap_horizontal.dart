import 'package:flutter/material.dart';

import 'gap.dart';

class GapHorizontal extends Gap {
  const GapHorizontal({
    super.key,
    required super.size,
  }) : super(direction: Axis.horizontal);
}
