import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../../constants/ui/colors.dart';
import '../../../widgets/texts/texts.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: AppEdgeInsets.only(
        bottom: 2.rem,
        top: 2.rem,
        left: 2.rem,
        right: 1.rem,
      ),
      color: AppColors.brand700,
      child: AppRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextDisplayXs.semiBold(
            'August',
            color: AppColors.white,
          ),
          AppButton(
            backgroundColor: AppColors.brand50,
            borderRadius: AppBorderRadius.all(AppRadius.circular(.5.rem)),
            onPressed: () {},
            child: AppRow(
              gap: .5.rem,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppIcon(
                  icon: AppIcons.plus,
                  color: AppColors.brand700,
                ),
                TextSm.semiBold(
                  'Add Task',
                  color: AppColors.brand700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
