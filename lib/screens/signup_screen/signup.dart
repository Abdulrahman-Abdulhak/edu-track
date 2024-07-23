import 'package:edu_track/constants/ui/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/constants/ui/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppImages.logo,
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Code Wizerds",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                AppSvg.menu,
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              AppImages.logo,
              width: 36,
              height: 36,
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            "Join Our Community!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.gray900,
              fontSize: 24,
            ),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Enter your email",
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.gray500,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray300),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: AppColors.brand600,
                ),
                child: Text(
                  "Continue with email",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                )),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "OR",
                  style: TextStyle(color: AppColors.gray500, fontSize: 14),
                ),
              ),
              Expanded(
                  child: Divider(
                color: AppColors.gray200,
              )),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: AppColors.gray300)),
                  backgroundColor: AppColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSvg.google,
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 12),
                    const Text(
                      "Sign up with Google",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.gray700,
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: AppColors.gray300)),
                  backgroundColor: AppColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSvg.facebook,
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 12),
                    const Text(
                      "Sign up with Facebook",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.gray700,
                      ),
                    ),
                  ],
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray600,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: AppColors.brand700,
                      fontSize: 14,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
