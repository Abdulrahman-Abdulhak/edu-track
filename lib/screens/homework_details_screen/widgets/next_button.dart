import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../../../widgets/texts/text/text.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: Colors.transparent,
      onPressed: () {},
      child: AppRow(
        gap: .5.rem,
        children: [
          TextSm.semiBold(
            'Previous Activity',
            color: AppColors.brand700,
          ),
          AppIcon(
            icon: AppIcons.arrowRight,
            color: AppColors.brand700,
            size: 1.25.rem,
          ),
        ],
      ),
    );
  }
}
