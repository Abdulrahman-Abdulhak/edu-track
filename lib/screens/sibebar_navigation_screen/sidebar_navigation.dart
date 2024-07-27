import 'package:edu_track/_main/app_edge_insets_geometry.dart';
import 'package:edu_track/_main/widget/app_stateless_widget.dart';
import 'package:edu_track/constants/ui/colors.dart';
import 'package:edu_track/screens/sibebar_navigation_screen/sections/list_tile.dart';
import 'package:edu_track/screens/sibebar_navigation_screen/sections/search.dart';
import 'package:edu_track/utils/extensions/extensions.dart';
import 'package:edu_track/widgets/navigation/nav_item.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SidebarNavigationScreen extends AppStatelessWidget {
  SidebarNavigationScreen({super.key});

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
        padding:
            AppEdgeInsets.symmetric(horizontal: 1.5.rem, vertical: 1.5.rem),
        child: AppColumn(
          gap: .25.rem,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(),
            GapVertical(size: 1.5.rem),
            NavItem(icon: AppIcons.barChartVertical, text: "Dashboard"),
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
            Divider(),
            ListTitlSection(),
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
