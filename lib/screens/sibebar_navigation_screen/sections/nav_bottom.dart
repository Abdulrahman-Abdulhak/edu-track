import "package:flutter/material.dart";

import 'package:edu_track/core/core.dart';
import "package:edu_track/models/models.dart";
import "package:edu_track/widgets/widgets.dart";
import "package:edu_track/constants/constants.dart";

import '../widgets/widgets.dart';

const _navItems = [
  NavItemModel(icon: AppIcons.lifeBuoy, label: "Support"),
  NavItemModel(icon: AppIcons.settings, label: "Settings"),
];
const _userAccount = Account(name: "Johan M.", email: "johan-m@edy-truck.com");

class NavBottom extends StatelessWidget {
  const NavBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var email = "sara.n@edy-truck.com";
    var name = "sara nour abd".words().sublist(0, 2);

    var imageNull = name.combineFirstLetters();

    return AppColumn(
      children: [
        NavItems(
          items: _navItems.to(
            (item) => NavItem(
              onPressed: () {
                // TODO: implement.
              },
              icon: item.icon,
              text: item.label,
            ),
          ),
        ),
        const AppDivider(),
        AppListTile(
          horizontalTitleGap: .75.rem,
          leading: AppContainer(
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: const AppBoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.brand50,
            ),
            width: 2.5.rem,
            height: 2.5.rem,
            child: TextMd.regular(
              imageNull,
              style: AppTextStyle(
                color: AppColors.brand600,
                fontSize: 1.rem,
              ),
            ),
          ),
          title: TextSm.semiBold(
            "${name.first} ${name.last.firstChar}.",
            textTransform: TextTransform.capitalize,
            style: const AppTextStyle(color: AppColors.gray900),
          ),
          subtitle: TextSm(
            email,
            color: AppColors.gray600,
            textTransform: TextTransform.lowercase,
          ),
          trailing: AccountAppBar(
            account: _userAccount,
            actions: [
              AppIconButton(
                onPressed: () {
                  //TODO: implement.
                },
                icon: AppIcons.logOut,
                size: 1.25.rem,
                color: AppColors.gray500,
                padding: AppEdgeInsets.all(.5.rem),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
