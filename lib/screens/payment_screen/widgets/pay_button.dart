import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class PayButton extends StatelessWidget {
  final Color labelColor;

  final PaymentMethod method;

  const PayButton(
    this.method, {
    super.key,
    this.labelColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    final radius = AppBorderRadius.all(AppRadius.circular(.5.rem));

    final Widget? icon;
    if (method.iconAsImagePath != null) {
      icon = AppImage(
        path: method.iconAsImagePath!,
        height: 1.25.rem,
      );
    } else if (method.icon != null) {
      icon = AppIcon(
        icon: method.icon!,
        size: 1.25.rem,
      );
    } else {
      icon = null;
    }

    return AppButton(
      onPressed: method.pay,
      backgroundColor: method.primaryColor,
      borderRadius: radius,
      width: 100.vw,
      padding: AppEdgeInsets.symmetric(
        horizontal: 1.125.rem,
        vertical: .625.rem,
      ),
      icon: icon,
      child: TextMd.semiBold(
        'Pay With ${method.name}',
        color: labelColor,
      ),
    );
  }
}
