import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/constants/constants.dart';

import '../widgets/widgets.dart';

final _paymentMethods = [
  PaymentMethod(
    name: 'Syriatel',
    pay: () {
      //TODO: implement.
    },
    iconAsImagePath: AppImages.syriatel,
    primaryColor: const Color(0xFFF70507),
  ),
  PaymentMethod(
    name: 'MTN',
    pay: () {
      //TODO: implement.
    },
    iconAsImagePath: AppImages.mtn,
    primaryColor: const Color(0xFFFFCC00),
  ),
];

class DefinedPayButtons extends StatelessWidget {
  const DefinedPayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: 1.rem,
      children: _paymentMethods.to((method) => PayButton(method)),
    );
  }
}
