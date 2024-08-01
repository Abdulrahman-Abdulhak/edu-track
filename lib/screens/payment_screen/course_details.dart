import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../constants/ui/colors.dart';
import '../../widgets/texts/text/xs.dart';

class CoursePaymentDetail extends StatelessWidget {
  CoursePaymentDetail({
    super.key,
    required this.courseTitle,
    required this.cost,
    this.additionFeesCost,
  });
  String? additionFeesCost;
  final String courseTitle;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: .75.rem,
      children: [
        AppRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextXs.regular(courseTitle),
            ),
            TextXs.medium(
              '$cost\$',
              color: AppColors.brand700,
            ),
          ],
        ),
        AppRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextXs.regular('Addition Fees'),
            ),
            TextXs.medium(
              additionFeesCost == null ? '0\$' : '$additionFeesCost\$',
              color: AppColors.brand700,
            ),
          ],
        ),
        AppRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextXs.semiBold('Total'),
            ),
            TextXs.medium(
              '$cost$additionFeesCost\$',
              color: AppColors.brand700,
            ),
          ],
        ),
      ],
    );
  }
}
