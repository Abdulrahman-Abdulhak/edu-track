import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = AppBorderRadius.circular(.5.rem);

    return AppColumn(
      gap: 1.rem,
      children: [
        AppTextField(
          keyboardType: TextInputType.emailAddress,
          decoration: AppInputDecoration(
            //TODO: add text transformation
            hintText: translation(context).enterYourEmail,
            hintStyle: Typographies.textMd.withStyles(
              color: AppColors.gray500,
            ),
            contentPadding: AppEdgeInsets.symmetric(
              horizontal: 0.875.rem,
              vertical: 0.625.rem,
            ),
            border: AppOutlineInputBorder(
              borderSide: const AppBorderSide(color: AppColors.gray300),
              borderRadius: borderRadius,
            ),
          ),
        ),
        AppButton(
          backgroundColor: AppColors.brand600,
          width: 100.cqw,
          padding: AppEdgeInsets.symmetric(
            horizontal: 1.125.rem,
            vertical: 0.625.rem,
          ),
          borderRadius: borderRadius,
          onPressed: () {
            //TODO: implement.
          },
          child: TextMd.semiBold(
            translation(context).continueWithEmail,
            style: const AppTextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
