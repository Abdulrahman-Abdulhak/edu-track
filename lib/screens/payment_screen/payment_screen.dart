import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import './sections/sections.dart';

@RoutePage()
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppRow(
          gap: 2.rem,
          children: [
            AppIcon(
              icon: AppIcons.arrowLeft,
              size: 1.5.rem,
              color: AppColors.gray700,
            ),
            TextMd.semiBold('Payment'),
          ],
        ),
      ),
      body: AppPadding(
        padding: AppEdgeInsets.all(1.rem),
        child: AppColumn(
          gap: 1.rem,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CoursePaymentsDetails(),
            AppDivider(),
            DefinedPayButtons(),
            AppDivider(),
            BankPayments(),
          ],
        ),
      ),
    );
  }
}
