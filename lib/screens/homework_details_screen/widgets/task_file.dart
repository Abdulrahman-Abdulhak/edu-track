import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../../../widgets/texts/text/text.dart';

class TaskFile extends StatelessWidget {
  const TaskFile(
      {super.key,
      required this.filaName,
      required this.fileSize,
      required this.professorName});
  final String filaName;
  final String fileSize;
  final String professorName;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: AppEdgeInsets.all(.62.rem),
      decoration: AppBoxDecoration(
        borderRadius: AppBorderRadius.only(
          bottomLeft: AppRadius.circular(.5.rem),
          bottomRight: AppRadius.circular(.5.rem),
          topLeft: AppRadius.circular(.5.rem),
        ),
        border: AppBorder.all(color: AppColors.gray200),
      ),
      child: AppListTile(
        leading: AppContainer(
          width: 2.rem,
          height: 2.rem,
          clipBehavior: Clip.antiAlias,
          decoration: const AppBoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.brand100,
          ),
          child: AppIcon(
            icon: AppIcons.file,
            color: AppColors.brand600,
            size: .5.rem,
          ),
        ),
        title: TextMd.regular(
          filaName,
          style: AppTextStyle(
            decoration: TextDecoration.underline,
            fontSize: .875.rem,
          ),
        ),
        subtitle: AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSm.regular(
              fileSize,
              color: AppColors.gray600,
              style: AppTextStyle(
                fontSize: .875.rem,
              ),
            ),
            AppRow(
              children: [
                AppIcon(
                  icon: AppIcons.profile,
                  color: AppColors.gray500,
                  size: 1.rem,
                ),
                TextXs.medium(
                  professorName,
                  color: AppColors.gray500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
