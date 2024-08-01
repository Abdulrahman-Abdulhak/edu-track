import 'package:flutter/material.dart';

import '../text/text.dart';
import '../../_main/main.dart';
import '../../types/types.dart';

class AppTextButton extends StatelessWidget {
  final AppTextStyle? textStyle;

  final VoidFunction onPressed;
  final Widget text;

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
