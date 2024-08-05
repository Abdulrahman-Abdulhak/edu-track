import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class PageAppBar extends AppHeaderNav {
  PageAppBar({super.key, required super.titleText});

  @override
  PreferredSizeWidget compute(
    BuildContext context,
    BoxConstraints? constraints,
  ) {
    return AppHeaderNav(
      titleText: titleText,
      titleStyle: Typographies.textMd.merge(AppTypographies.semiBold),
    ).compute(context, constraints);
  }
}
