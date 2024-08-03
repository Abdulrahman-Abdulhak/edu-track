import "package:flutter/material.dart";

import 'package:edu_track/core/core.dart';
import "package:edu_track/widgets/widgets.dart";
import "package:edu_track/constants/constants.dart";

class NavItem extends StatelessWidget {
  final int? index, notificationCount;

  final List children;

  final VoidFunction onPressed;
  final AppIcons icon;
  final String text;

  const NavItem({
    super.key,
    this.index,
    this.notificationCount,
    this.children = const [],
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var focusedIndex = 2;

    return AppContainer(
      clipBehavior: Clip.antiAlias,
      decoration: AppBoxDecoration(
        color: index == focusedIndex ? AppColors.gray50 : null,
        borderRadius: AppBorderRadius.circular(6.px),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: AppPadding(
          padding: AppEdgeInsets.symmetric(
            horizontal: 0.25.rem,
            vertical: .5.rem,
          ),
          child: AppRow(
            gap: .75.rem,
            children: [
              AppIcon(
                icon: icon,
                color: AppColors.gray500,
                size: 1.5.em,
              ),
              TextMd.semiBold(
                text,
                color: AppColors.gray700,
                textTransform: TextTransform.capitalize,
              ),
              if (notificationCount != null || children.isNotEmpty)
                const Spacer(),
              if (notificationCount != null)
                AppBadge(
                  label: notificationCount,
                  color: AppColors.error50,
                  labelColor: AppColors.error700,
                ),
              if (notificationCount != null && children.isNotEmpty)
                GapHorizontal(size: .5.rem),
              if (children.isNotEmpty)
                AppIconButton(
                  onPressed: () {
                    //TODO: implement.
                  },
                  icon: AppIcons.chevronDown,
                  size: 1.25.em,
                  color: AppColors.gray400,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
