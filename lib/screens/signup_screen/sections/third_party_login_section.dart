import 'package:edu_track/types/types.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';
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
          label: "Sign up with Google",
        ),
        _LoginButton(
          onPressed: () {
            //TODO: implement.
          },
          logo: AppImages.facebook,
          label: "Sign up with Facebook",
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String label, logo;
  final VoidFunction onPressed;

  const _LoginButton(
      {required this.label, required this.logo, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      gap: .75.rem,
      padding: AppEdgeInsets.symmetric(horizontal: 1.rem, vertical: .625.rem),
      borderRadius: AppBorderRadius.all(.75.rem),
      border: const AppBorderSide(color: AppColors.gray300),
      width: 100.cqw,
      icon: AppImage(
        path: logo,
        width: 1.5.rem,
        height: 1.5.rem,
      ),
      child: TextMd.semiBold(
        label,
        style: const AppTextStyle(color: AppColors.gray700),
      ),
    );
  }
}
