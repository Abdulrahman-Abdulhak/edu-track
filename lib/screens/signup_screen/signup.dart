import 'package:edu_track/constants/ui/images.dart';
import 'package:edu_track/widgets/layout/divider.dart';
import 'package:edu_track/screens/signup_screen/login_button.dart';
import 'package:edu_track/screens/signup_screen/logo.dart';
import 'package:edu_track/utils/extensions/num.dart';
import 'package:edu_track/widgets/button/button.dart';
import 'package:edu_track/widgets/button/button_with_logo.dart';
import 'package:edu_track/widgets/icons/app_icon.dart';
import 'package:edu_track/widgets/text/big_text.dart';
import 'package:edu_track/widgets/text/text_field.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/constants/ui/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController Textcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Logo(size: 24, alignment: Alignment.topLeft),
                const SizedBox(width: 5),
                BigText(text: "Code Wizards", sizeBool: false, colorBool: true),
              ],
            ),
          ],
        ),
        actions: [
          AppIcon(
            icon: AppIcons.menuSolid,
            color: AppColors.gray700,
            fit: BoxFit.contain,
            size: 24.px,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(
          children: [
            const Logo(size: 36, alignment: Alignment.center),
            const SizedBox(height: 25),
            BigText(
              text: "Join Our Community!",
              sizeBool: true,
              colorBool: false,
            ),
            const SizedBox(height: 35),
            AppTextField(
              controller: Textcontroller,
              hintText: "Enter your email",
            ),
            const SizedBox(height: 25),
            AppTextButton(
              text: "Continue with email",
              backgroundColor: AppColors.brand600,
              fontColor: AppColors.white,
              onPressed: () {},
            ),
            const SizedBox(height: 25),
            AppDivider(
              label: TextSm("OR"),
            ),
            const SizedBox(height: 25),
            ButtonWithLogo(
              logo: AppLogo.google,
              text: "Sign up with Google",
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            ButtonWithLogo(
              logo: AppLogo.facebook,
              text: "Sign up with Facebook",
              onPressed: () {},
            ),
            const SizedBox(height: 35),
            LoginButton(),
          ],
        ),
      ),
    );
  }
}
