import 'package:edu_track/constants/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonWithLogo extends StatefulWidget {
  const ButtonWithLogo(
      {super.key,
      required this.logo,
      required this.text,
      required this.onPressed});
  final String logo;
  final String text;
  final void Function() onPressed;

  @override
  State<ButtonWithLogo> createState() => _ButtonWithLogoState();
}

class _ButtonWithLogoState extends State<ButtonWithLogo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: AppColors.gray300)),
            backgroundColor: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.logo,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.gray700,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
