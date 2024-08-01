import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/constants/ui/colors.dart';
import 'package:edu_track/screens/payment_screen/course_details.dart';
import 'package:edu_track/screens/payment_screen/pay_button.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

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
          gap: .75.rem,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSm.regular('Payment for course'),
            CoursePaymentDetail(
              courseTitle:
                  'Python Programing for beginners. Basic rules in 5 hourse',
              cost: '10',
            ),
            const Divider(),
            PayButton(),
            const Divider(),
            TextXs.semiBold('Or Pay with Banks'),
          ],
        ),
      ),
    );
  }
}
