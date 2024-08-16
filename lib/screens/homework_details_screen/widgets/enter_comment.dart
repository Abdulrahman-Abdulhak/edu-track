import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

class EnterComment extends StatelessWidget {
  const EnterComment({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      decoration: AppInputDecoration(
        contentPadding: AppEdgeInsets.all(.62.rem),
        border: AppOutlineInputBorder(
          borderRadius: AppBorderRadius.circular(.5.rem),
          borderSide: const AppBorderSide(color: AppColors.gray300),
        ),
        hintText: 'Enter a comment',
        hintStyle: AppTextStyle(fontSize: 1.rem),
      ),
    );
  }
}
