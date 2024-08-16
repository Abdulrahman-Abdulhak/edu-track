import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/texts/texts.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SubmissionStatus extends StatelessWidget {
  const SubmissionStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: .75.rem,
      children: [
        TextMd.semiBold('Submission Status'),
        const TaskDetails(
          details: 'Submission status',
          status: 'No Attempt',
          appIcons: AppIcons.x,
        ),
        const TaskDetails(
          details: 'Grading Status',
          status: 'Not Graded',
          appIcons: AppIcons.x,
        ),
        const TaskDetails(
          details: 'Due date',
          status: 'Saturday, 1 June 2024, 12:00 AM',
          appIcons: AppIcons.clockOutline,
        ),
        const TaskDetails(
          details: 'Time remaining',
          status: 'Saturday, 20 June 2024, 12:00 AM',
          appIcons: AppIcons.clockOutline,
        ),
        const TaskDetails(
          details: 'Last modified',
          status: '.',
          appIcons: AppIcons.minus,
        ),
      ],
    );
  }
}
