import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/constants/constants.dart';

import './images/images.dart';

const _userAccount = Account(
  id: 15,
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
      decoration: AppBoxDecoration(
        color: AppColors.white,
        border: AppBorder(
          top: AppBorderSide(width: 1.px, color: AppColors.gray100),
        ),
      ),
      padding: AppEdgeInsets.symmetric(horizontal: 35.px, vertical: 12.px),
      child: AppRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _icons.toIndexed((item, i) {
          Widget? child;
          AppIcons? icon;

          if (item is Widget) child = item;
          if (item is AppIcons) icon = item;

          final isActive = tabs.activeIndex == i;
          return AppIconButton(
            padding: AppEdgeInsets.all(.5.rem),
            onPressed: () {
              tabs.setActiveIndex(i);
            },
            icon: icon,
            size: _iconsSize,
            color: isActive ? AppColors.purple700 : AppColors.gray700,
            child: child,
          );
        }),
      ),
    );
  }
}
