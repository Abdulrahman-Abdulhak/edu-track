import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import './sections/sections.dart';

class SidebarNavigationScreen extends StatelessWidget {
  const SidebarNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppRow(
          gap: .5.rem,
          children: [
            Logo(size: 2.rem),
            TextDisplayXs.medium("EduTrack"),
          ],
        ),
      ),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(
          horizontal: 1.5.rem,
          vertical: 1.5.rem,
        ),
        child: AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Search(),
            GapVertical(size: 1.5.rem),
            const Expanded(child: Middle()),
            const NavBottom(),
          ],
        ),
      ),
    );
  }
}
