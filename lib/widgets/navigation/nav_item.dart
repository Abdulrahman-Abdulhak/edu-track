import "package:edu_track/_main/main.dart";
import "package:edu_track/constants/constants.dart";
import "package:edu_track/constants/ui/colors.dart";
import "package:edu_track/utils/extensions/extensions.dart";
import "package:edu_track/widgets/icons/app_icon.dart";
import "package:edu_track/widgets/layout/flexes/flexes.dart";
import "package:edu_track/widgets/text/addons/addons.dart";
import "package:edu_track/widgets/text/texts/texts.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class NavItem extends AppStatelessWidget {
  const NavItem({super.key, required this.icon, required this.text});
  final AppIcons icon;
  final String text;

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final borderRadius = AppBorderRadius.all(.5.rem);

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
        Container(
          alignment: Alignment.center,
          width: 36,
          height: 24,
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 0.12, horizontal: 0.25),
          decoration: BoxDecoration(
            color: AppColors.error50,
            borderRadius: borderRadius.compute(context, constraints),
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
        )
      ],
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return true;
  }
}
