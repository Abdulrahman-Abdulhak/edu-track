import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import 'package:edu_track/screens/sibebar_navigation_screen/widgets/nav_item.dart';

import './sections/search.dart';
import './sections/list_tile.dart';

class SidebarNavigationScreen extends AppStatelessWidget {
  final String firstName, lastName, email;

  SidebarNavigationScreen({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
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
          gap: .25.rem,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Search(),
            GapVertical(size: 1.5.rem),
            NavItem(
              icon: AppIcons.barChartVertical,
              text: "Dashboard",
            ),
            NavItem(icon: AppIcons.documentLinear, text: "Homework"),
            NavItem(
                icon: AppIcons.successCheckOutline, text: "Exams & Results"),
            NavItem(icon: AppIcons.bookmark, text: "My Courses"),
            NavItem(icon: AppIcons.book, text: "Library"),
            NavItem(icon: AppIcons.userX, text: "Absences"),
            NavItem(icon: AppIcons.cupStarOutline, text: "Achievements"),
            Spacer(),
            NavItem(icon: AppIcons.lifeBuoy, text: "Support"),
            NavItem(icon: AppIcons.settings, text: "Settings"),
            const Divider(),
            ListTileSection(
              firstName: firstName,
              lastName: lastName,
              email: email,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return true;
  }
}
