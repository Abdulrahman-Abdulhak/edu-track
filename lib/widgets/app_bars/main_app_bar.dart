import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

import '../texts/texts.dart';

class MainAppBar extends AppHeaderNav {
  MainAppBar({super.key});

  @override
  PreferredSizeWidget compute(
    BuildContext context,
    BoxConstraints? constraints,
  ) {
    return AppHeaderNav(
      leading: Logo(size: 1.5.em),
      leadingGap: .5.rem,
      title: TextMd.semiBold(translation(context).teamName),
      actions: [
        AppIconButton(
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
