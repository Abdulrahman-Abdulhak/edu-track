import 'package:flutter/widgets.dart';

import 'package:edu_track/core/core.dart';

class PaymentMethod {
  final String? iconAsImagePath;
  final Color? primaryColor;
  final AppIcons? icon;

  final String name;
  final VoidFunction pay;

  const PaymentMethod({
    this.iconAsImagePath,
    this.primaryColor,
    this.icon,
    required this.name,
    required this.pay,
  });
}
