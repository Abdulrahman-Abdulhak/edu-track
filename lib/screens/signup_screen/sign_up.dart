import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import './sections/intro_section.dart';
import './sections/email_section.dart';
import './sections/third_party_login_section.dart';
import './sections/already_have_account.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.white,
      appBar: MainAppBar(),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(vertical: 3.rem, horizontal: 1.rem),
        child: AppColumn(
          gap: 1.5.rem,
          children: [
            const IntroSection(),
            GapVertical(size: 2.rem),
            const EmailSection(),
            AppDivider(
              label: TextSm(
                translation(context).or,
                textTransform: TextTransform.uppercase,
                style: const AppTextStyle(color: AppColors.gray500),
              ),
              color: AppColors.gray200,
            ),
            const ThirdPartyLoginSection(),
            GapVertical(size: 2.rem),
            const AlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}
