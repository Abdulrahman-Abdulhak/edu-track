import 'package:edu_track/constants/ui/colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.gray200,
          ),
        ),
        Text(
          "OR",
          style: TextStyle(color: AppColors.gray500, fontSize: 14),
        ),
        Expanded(
          child: Divider(
            color: AppColors.gray200,
          ),
        ),
      ],
    );
  }
}
