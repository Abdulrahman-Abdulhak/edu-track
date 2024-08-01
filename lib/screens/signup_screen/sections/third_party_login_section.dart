import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class ThirdPartyLoginSection extends StatelessWidget {
  const ThirdPartyLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: .75.rem,
      children: [
        _LoginButton(
          onPressed: () {
            //TODO: implement.
          },
          logo: AppImages.google,
          company: translation(context).google.capitalize(),
        ),
        _LoginButton(
          onPressed: () {
            //TODO: implement.
          },
          logo: AppImages.facebook,
          company: translation(context).facebook.capitalize(),
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String company, logo;
  final VoidFunction onPressed;

  const _LoginButton({
    required this.company,
    required this.logo,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      gap: .75.rem,
      padding: AppEdgeInsets.symmetric(horizontal: 1.rem, vertical: .625.rem),
      borderRadius: AppBorderRadius.circular(.75.rem),
      border: const AppBorderSide(color: AppColors.gray300),
      width: 100.cqw,
      icon: AppImage(
        path: logo,
        width: 1.5.rem,
        height: 1.5.rem,
      ),
      child: TextMd.semiBold(
        "${translation(context).signUpWith} $company",
        style: const AppTextStyle(color: AppColors.gray700),
      ),
    );
  }
}
