import 'package:flutter/material.dart';

import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/widgets/widgets.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRow(
      gap: .5.rem,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextSm(
          "Already have an account?",
          style: const AppTextStyle(
            color: AppColors.gray600,
          ),
        ),
        AppTextButton(
          onPressed: () {
            //TODO: implement.
          },
          text: TextSm.semiBold(
            "Log in",
            style: const AppTextStyle(
              color: AppColors.brand700,
            ),
          ),
        ),
      ],
    );
  }
}
