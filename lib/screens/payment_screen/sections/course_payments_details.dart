import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';

import '../widgets/widgets.dart';

const _courses = [
  Payment(
    cost: 10,
    title: 'Python Programming for beginners. Basic rules in 5 hours',
  ),
  Payment(
    cost: 5,
    title: 'Additional Fees',
  )
];

class CoursePaymentsDetails extends StatelessWidget {
  const CoursePaymentsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: .75.rem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextSm.regular('Payment for course'),
        ..._courses.to((payment) => PaymentTile(payment)),
        GapVertical(size: 1.rem),
        PaymentTile(
          _courses.reduce(
            (acc, pay) => Payment(cost: acc.cost + pay.cost, title: "Total"),
          ),
        ),
      ],
    );
  }
}
