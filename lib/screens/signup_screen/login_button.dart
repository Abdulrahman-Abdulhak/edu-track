import 'package:edu_track/constants/ui/colors.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.gray600,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Log in",
            style: TextStyle(
              color: AppColors.brand700,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
