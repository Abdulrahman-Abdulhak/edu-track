import 'dart:ui';

import 'package:edu_track/core/core.dart';

//* this class holds all the values needed for all text used in the application
class Typographies {
  static const textXs = AppTextStyle(
    fontSize: Em(0.75),
    lineHeight: 1.125 / 0.75,
  );
  static const textSm = AppTextStyle(
    fontSize: Em(0.875),
    lineHeight: 1.25 / 0.875,
  );
  static const textMd = AppTextStyle(
    fontSize: Em(1),
    lineHeight: 1.5 / 1,
  );
  static const textLg = AppTextStyle(
    fontSize: Em(1.125),
    lineHeight: 1.75 / 1.125,
  );

  static const displayXs = AppTextStyle(
    fontSize: Em(1.5),
    lineHeight: 2 / 1.5,
  );
  static const displaySm = AppTextStyle(
    fontSize: Em(1.875),
    lineHeight: 2.375 / 1.875,
  );

  static const regular = AppTextStyle(fontWeight: FontWeight.w400);
  static const medium = AppTextStyle(fontWeight: FontWeight.w500);
  static const semiBold = AppTextStyle(fontWeight: FontWeight.w600);
}
