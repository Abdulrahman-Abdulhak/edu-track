import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../../../widgets/texts/texts.dart';
import '../widgets/widgets.dart';

class NameButtonSection extends StatelessWidget {
  const NameButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: 1.rem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDisplayXs.semiBold('Sara N.'),
        GapVertical(size: .25.rem),
        TextMd.regular('saran.2020@codewizards.com'),
        AppRow(
          gap: .75.rem,
          children: [
            ProfileButton(
              backgroundColor: AppColors.white,
              borderColor: AppColors.gray300,
              onPressed: () {},
              child: AppRow(
                gap: .5.rem,
                children: [
                  AppIcon(
                    icon: AppIcons.userPLus,
                    color: AppColors.gray700,
                    size: 1.25.rem,
                  ),
                  TextSm.semiBold('Share'),
                ],
              ),
            ),
            ProfileButton(
              onPressed: () {},
              backgroundColor: AppColors.brand600,
              borderColor: AppColors.brand600,
              child: TextSm.semiBold(
                'View profile',
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
