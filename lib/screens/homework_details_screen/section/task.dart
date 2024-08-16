import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: 1.25.rem,
      children: const [
        Subject(
          subjectTitle: 'Mathematics',
          backgroundColor: AppColors.success100,
          appIcons: AppIcons.mathXY,
          iconColor: AppColors.success600,
        ),
        Divider(
          color: AppColors.gray200,
        ),
        TaskTitle(task: 'Task 11 - P11.Pdf'),
        TaskFile(
          filaName: 'Assignment1.Pdf',
          fileSize: '200K',
          professorName: 'Prof.Mohamad Hamda',
        ),
      ],
    );
  }
}
