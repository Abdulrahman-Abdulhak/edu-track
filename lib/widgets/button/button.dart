import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.fontColor,
  });
  final void Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
