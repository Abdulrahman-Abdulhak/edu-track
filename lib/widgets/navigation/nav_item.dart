import "dart:ffi";

import "package:edu_track/_main/main.dart";
import "package:edu_track/constants/constants.dart";
import "package:edu_track/constants/ui/colors.dart";
import "package:edu_track/utils/extensions/extensions.dart";
import "package:edu_track/widgets/icons/app_icon.dart";
import "package:edu_track/widgets/layout/flexes/flexes.dart";
import "package:edu_track/widgets/layout/layout.dart";
import "package:edu_track/widgets/text/addons/addons.dart";
import "package:edu_track/widgets/text/texts/texts.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";

class NavItem extends AppStatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.text,
    // this.number,
  });
  final AppIcons icon;
  final String text;
  // String number;

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final borderRadius = AppBorderRadius.circular(.5.rem);

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
        AppContainer(
          alignment: Alignment.center,
          width: 1.8125.rem,
          height: 1.5.rem,
          padding: AppEdgeInsets.symmetric(
            vertical: 0.63.rem,
            horizontal: 0.13.rem,
          ),
          decoration: AppBoxDecoration(
            color: AppColors.error50,
            borderRadius: borderRadius,
          ),
          child: TextSm.medium(
            "10",
            style: AppTextStyle(
              color: AppColors.error700,
              fontSize: .875.rem,
            ),
          ),
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

  @override
  bool needsConstraints(BuildContext context) {
    return true;
  }
}
