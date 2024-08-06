import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';

import './sections/sections.dart';

const _userAccount = Account(
  name: "Johan M.",
  email: "johan-m@edy-truck.com",
  type: UserType.teacher,
  organization: "Elite School",
);

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const inlinePadding = Rem(1);

    final sections = [
      const HeaderSection(user: _userAccount, inlinePadding: inlinePadding),
      const Statistics(user: _userAccount, inlinePadding: inlinePadding),
      const RecentAccessedCourses(
        user: _userAccount,
        inlinePadding: inlinePadding,
      ),
      const CoursesUpdate(user: _userAccount, inlinePadding: inlinePadding),
      const UpcomingCourses(user: _userAccount, inlinePadding: inlinePadding),
      // const LatestSubmissionUpdates(user: _userAccount),
    ];

    return AppListView.separated(
      itemCount: sections.length,
      padding: AppEdgeInsets.symmetric(
        vertical: 2.rem,
      ),
      itemBuilder: (context, index) => sections[index],
      separatorBuilder: (context, index) => GapVertical(size: 2.rem),
    );
  }
}
