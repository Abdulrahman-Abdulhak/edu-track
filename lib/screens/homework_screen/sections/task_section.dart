import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../widgets/task_card.dart';

class TaskSection extends StatelessWidget {
  const TaskSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskCard(
      onSeeMore: () {},
      cardCount: 3,
      cardType: 'Mathematics',
      taskTitle: 'Task 11 - P11.Pdf',
      professorName: 'Prof.Mohamad Hamda',
      due: 'Due, Nov 11, 2024, 11PM',
      taskStatus: 'View Homework',
      appIcons: AppIcons.arrowRight,
    );
  }
}
