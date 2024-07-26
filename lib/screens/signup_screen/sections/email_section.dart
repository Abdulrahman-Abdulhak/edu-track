import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class EmailSection extends AppStatelessWidget {
  const EmailSection({super.key});

  @override
  Widget awareBuild(BuildContext? context, BoxConstraints? constraints) {
    final borderRadius = AppBorderRadius.all(.5.rem);

    return AppColumn(
      gap: 1.rem,
      children: [
        AppTextField(
          keyboardType: TextInputType.emailAddress,
          decoration: AppInputDecoration(
            hintText: "Enter your email",
            hintStyle: Typographies.textMd.withStyles(
              color: AppColors.gray500,
            ),
            contentPadding: AppEdgeInsets.symmetric(
              horizontal: 0.875.rem,
              vertical: 0.625.rem,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.gray300),
              borderRadius: borderRadius.compute(context, constraints),
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
            "Continue with email",
            style: const AppTextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return true;
  }
}
