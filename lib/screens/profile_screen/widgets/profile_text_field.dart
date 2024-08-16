import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/texts/texts.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      decoration: AppInputDecoration(
        label: TextSm.medium(label),
        contentPadding: AppEdgeInsets.symmetric(
          horizontal: .52.rem,
          vertical: .88.rem,
        ),
        border: AppOutlineInputBorder(
          borderRadius: AppBorderRadius.circular(.5.rem),
          borderSide: const AppBorderSide(
            color: AppColors.gray300,
          ),
        ),
      ),
    );
  }
}

class ProfileTextFieldIcon extends StatelessWidget {
  const ProfileTextFieldIcon(
      {super.key, required this.label, required this.appIcons});
  final String label;
  final AppIcons appIcons;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      decoration: AppInputDecoration(
        prefixIcon: AppIcon(
          icon: appIcons,
          size: 1.25.rem,
          color: AppColors.gray500,
        ),
        label: TextSm.medium(label),
        contentPadding: AppEdgeInsets.symmetric(
          horizontal: .52.rem,
          vertical: .88.rem,
        ),
        border: AppOutlineInputBorder(
          borderRadius: AppBorderRadius.circular(.5.rem),
          borderSide: const AppBorderSide(
            color: AppColors.gray300,
          ),
        ),
      ),
    );
  }
}
