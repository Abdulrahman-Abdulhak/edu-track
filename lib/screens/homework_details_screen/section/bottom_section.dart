import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreviousButton(),
        NextButton(),
      ],
    );
  }
}
