import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';

import '../texts/texts.dart';

class SideNavAppBar extends AppHeaderNav {
  SideNavAppBar({super.key});

  @override
  PreferredSizeWidget compute(
    BuildContext context,
    BoxConstraints? constraints,
  ) {
    return AppHeaderNav(
      leadingGap: .5.rem,
      leading: Logo(size: 2.rem),
      title: TextDisplayXs.medium("EduTrack"),
    ).compute(context, constraints);
  }
}
