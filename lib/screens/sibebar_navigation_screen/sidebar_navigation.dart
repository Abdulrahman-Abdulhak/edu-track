import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import './sections/sections.dart';

class SidebarNavigationScreen extends StatelessWidget {
  const SidebarNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.white,
      appBar: SideNavAppBar(),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(
          horizontal: 1.5.rem,
          vertical: 1.5.rem,
        ),
        child: AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              onSubmit: (final str) {
                //TODO: implement.
              },
            ),
            GapVertical(size: 1.5.rem),
            const Expanded(child: Middle()),
            const NavBottom(),
          ],
        ),
      ),
    );
  }
}
