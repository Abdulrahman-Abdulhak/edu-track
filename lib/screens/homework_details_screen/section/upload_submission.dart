import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../../../widgets/texts/text/text.dart';
import '../widgets/widgets.dart';

class UploadSubmission extends StatelessWidget {
  const UploadSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: .75.rem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextMd.semiBold('Upload Submission'),
        const UploadFile(),
      ],
    );
  }
}
