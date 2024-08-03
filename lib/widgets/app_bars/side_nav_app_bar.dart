import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';

import '../texts/texts.dart';

class SideNavAppBar extends AppHeaderNav {
  SideNavAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeaderNav(
      leadingGap: .5.rem,
      leading: Logo(size: 2.rem),
      title: TextDisplayXs.medium("EduTrack"),
    );
  }
}
