import 'package:flutter/material.dart';

import './gap.dart';

class GapVertical extends Gap {
  const GapVertical({
    super.key,
    required super.size,
  }) : super(direction: Axis.vertical);
}
