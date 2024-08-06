import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../../constants/ui/colors.dart';
import '../../../widgets/texts/texts.dart';

class TopSection extends StatelessWidget {
  final bool addTaskMode;
  final DateTime date;
  final VoidFunction onAddTaskPressed;

  const TopSection({
    super.key,
    required this.addTaskMode,
    required this.date,
    required this.onAddTaskPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: AppEdgeInsetsDirectional.only(
        bottom: 2.rem,
        top: 2.rem,
        start: 2.rem,
        end: 1.rem,
      ),
      child: AppRow(
        mainAxisAlignment: addTaskMode
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          TextDisplayXs.semiBold(
            date.monthName(context),
            color: AppColors.white,
          ),
          if (!addTaskMode)
            AppButton(
              backgroundColor: AppColors.brand50,
              borderRadius: AppBorderRadius.all(AppRadius.circular(.5.rem)),
              padding: AppEdgeInsets.symmetric(
                vertical: .5.rem,
                horizontal: .875.rem,
              ),
              onPressed: onAddTaskPressed,
              icon: const AppIcon(
                icon: AppIcons.plus,
                color: AppColors.brand700,
              ),
              gap: .5.rem,
              child: TextSm.semiBold(
                'Add Task',
                color: AppColors.brand700,
              ),
            ),
        ],
      ),
    );
  }
}
