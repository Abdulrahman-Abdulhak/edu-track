import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/constants/constants.dart';

import './images/images.dart';

const _userAccount = Account(
  name: "Johan M.",
  email: "johan-m@edy-truck.com",
  type: UserType.teacher,
  organization: "Elite School",
);

const _iconsSize = Rem(1.75);
final _icons = [
  AppIcons.home,
  AppIcons.chat,
  AppIcons.calendar,
  const AccountImage(account: _userAccount, width: _iconsSize),
];

class BottomNavBar extends StatelessWidget {
  final TabsRouter tabs;
  const BottomNavBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppColors.white,
      padding: AppEdgeInsets.symmetric(horizontal: 35.px, vertical: 12.px),
      child: AppRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _icons.toIndexed((item, i) {
          if (item is Widget) return item;

          final isActive = tabs.activeIndex == i;
          return AppIconButton(
            onPressed: () {
              tabs.setActiveIndex(i);
            },
            icon: item as AppIcons,
            size: _iconsSize,
            color: isActive ? AppColors.purple700 : AppColors.gray700,
          );
        }),
      ),
    );
  }
}
