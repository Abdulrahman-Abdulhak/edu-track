import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/texts/texts.dart';
import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: Colors.transparent,
      onPressed: () {},
      child: AppRow(
        gap: .5.rem,
        children: [
          AppIcon(
            icon: AppIcons.arrowLeft,
            color: AppColors.brand700,
            size: 1.25.rem,
          ),
          TextSm.semiBold(
            'Previous Activity',
            color: AppColors.brand700,
          ),
        ],
      ),
    );
  }
}
