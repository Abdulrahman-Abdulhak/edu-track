import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

import '../texts/texts.dart';

class MainAppBar extends AppHeaderNav {
  final bool? withNotifications;

  MainAppBar({super.key, this.withNotifications});

  @override
  PreferredSizeWidget compute(
    BuildContext context,
    BoxConstraints? constraints,
  ) {
    return AppHeaderNav(
      leading: Logo(size: 1.5.em),
      leadingGap: .5.rem,
      title: TextMd.semiBold(translation(context).teamName),
      actionsGap: .25.rem,
      actions: [
        if (AppObject.toBool(withNotifications))
          AppIconButton(
            padding: AppEdgeInsets.all(.5.rem),
            onPressed: () => {
              //TODO: implement.
            },
            icon: AppIcons.notification,
            color: AppColors.gray700,
            size: 1.5.rem,
          ),
        AppIconButton(
          padding: AppEdgeInsets.all(.5.rem),
          onPressed: () => {
            //TODO: implement.
          },
          icon: AppIcons.menuSolid,
          color: AppColors.gray700,
          size: 1.5.rem,
        ),
      ],
    ).compute(context, constraints);
  }
}
