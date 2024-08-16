import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/texts/text/text.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SubmissionComment extends StatelessWidget {
  const SubmissionComment({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: .38.rem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextSm.semiBold('Submission Comment'),
        const EnterComment(),
      ],
    );
  }
}
