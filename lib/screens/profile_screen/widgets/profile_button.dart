import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton(
      {super.key,
      required this.onPressed,
      required this.backgroundColor,
      required this.borderColor,
      required this.child});
  final void Function() onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: backgroundColor,
      padding: AppEdgeInsets.symmetric(vertical: .62.rem, horizontal: 1.rem),
      onPressed: onPressed,
      borderRadius: AppBorderRadius.circular(.5.rem),
      border: AppBorderSide(
        color: borderColor,
      ),
      child: child,
    );
  }
}
