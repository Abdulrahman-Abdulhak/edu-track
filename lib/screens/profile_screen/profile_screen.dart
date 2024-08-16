import 'package:auto_route/auto_route.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bars/app_bars.dart';
import 'sections/sections.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: MainAppBar(),
      body: AppSingleChildScrollView(
        child: AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Cover(),
            GapVertical(size: 2.5.rem),
            AppPadding(
              padding: AppEdgeInsets.symmetric(
                horizontal: 1.rem,
                vertical: 1.5.rem,
              ),
              child: const AppColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameButtonSection(),
                  PersonalInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
