import 'package:flutter/material.dart';

class AppDivider extends Divider {
  final Widget? label;
  const AppDivider({
    super.key,
    super.color,
    super.indent,
    super.endIndent,
    super.height,
    super.thickness,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return super.build(context);
    }

    return Row(
      children: [
        Expanded(child: super.build(context)),
        label!,
        Expanded(child: super.build(context)),
      ],
    );
  }
}
