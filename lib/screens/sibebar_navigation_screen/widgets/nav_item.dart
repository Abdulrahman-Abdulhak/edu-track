import "package:flutter/material.dart";

import "package:edu_track/utils/utils.dart";
import "package:edu_track/widgets/widgets.dart";
import "package:edu_track/constants/constants.dart";

class NavItem extends StatelessWidget {
  final AppIcons icon;
  final String text;
  // String number;

  const NavItem({
    super.key,
    required this.icon,
    required this.text,
    // this.number,
  });

  @override
  Widget build(BuildContext context) {
    return AppRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      gap: .75.rem,
      children: [
        AppIcon(
          icon: icon,
          color: AppColors.gray500,
          size: 1.25.rem,
        ),
        TextMd.semiBold(text),
        const Spacer(),
        const AppBadge(
          label: "10",
          color: AppColors.error50,
          labelColor: AppColors.error700,
        ),
        GapHorizontal(size: .5.rem),
        AppIcon(
          icon: AppIcons.chevronDown,
          size: 1.25.rem,
          color: AppColors.gray400,
        ),
      ],
    );
  }
}
