import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';

import '../widgets/widgets.dart';

const _NavItems = [
  NavItemModel(icon: AppIcons.barChartVertical, label: "dashboard"),
  NavItemModel(icon: AppIcons.documentLinear, label: "Homework"),
  NavItemModel(icon: AppIcons.successCheckOutline, label: "Exams & Results"),
  NavItemModel(icon: AppIcons.bookmark, label: "My Courses"),
  NavItemModel(icon: AppIcons.book, label: "Library"),
  NavItemModel(icon: AppIcons.userX, label: "Absences"),
  NavItemModel(icon: AppIcons.cupStarOutline, label: "Achievements"),
];

class Middle extends StatelessWidget {
  const Middle({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSingleChildScrollView(
      padding: AppEdgeInsets.only(bottom: .5.rem),
      child: NavItems(
        items: _NavItems.to(
          (item) => NavItem(
            onPressed: () {
              // TODO: implement.
            },
            icon: item.icon,
            text: item.label,
          ),
        ),
      ),
    );
  }
}
