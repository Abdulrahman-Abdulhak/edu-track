import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class PaymentTile extends StatelessWidget {
  final Payment payment;

  const PaymentTile(this.payment, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          //FIXME: make the constraints actually work.
          child: AppConstrainedBox(
            constraints: AppBoxConstraints(maxWidth: 16.rem),
            child: TextXs.regular(payment.title, color: AppColors.gray700),
          ),
        ),
        TextXs.medium(
          payment.cost.toPrise(context),
          color: AppColors.brand700,
        ),
      ],
    );
  }
}
