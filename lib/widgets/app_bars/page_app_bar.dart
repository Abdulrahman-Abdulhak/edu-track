import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class PageAppBar extends AppHeaderNav {
  PageAppBar({super.key, required super.titleText});

  @override
  Widget build(BuildContext context) {
    return AppHeaderNav(
      titleText: titleText,
      titleStyle: Typographies.textMd.merge(AppTypographies.semiBold),
    );
  }
}
