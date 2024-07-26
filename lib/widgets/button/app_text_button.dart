import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/types/types.dart';

class AppTextButton extends StatelessWidget {
  final VoidFunction onPressed;
  final Widget text;
  final AppTextStyle? textStyle;

  const AppTextButton({
    super.key,
    this.textStyle,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final result = GestureDetector(
      onTap: onPressed,
      child: text,
    );

    if (textStyle != null) {
      return AppDefaultTextStyle(style: textStyle!, child: result);
    }

    return result;
  }
}
