import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';

import '../../constants/ui/colors.dart';
import '../../constants/ui/images.dart';
import '../../widgets/texts/text/md.dart';

class PayButton extends StatelessWidget {
  PayButton({super.key});

  AppBorderRadiusGeometry radius =
      AppBorderRadius.all(AppRadius.circular(.9.rem));

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      gap: 1.rem,
      children: [
        payButton(
            onPressed: () {},
            color: const Color(0xFFF70507),
            path: AppImages.syriatel,
            payWay: 'Syriatel'),
        payButton(
            onPressed: () {},
            color: const Color(0xFFFFCC00),
            path: AppImages.mtn,
            payWay: 'MTN'),
      ],
    );
  }

  Widget payButton({
    required Function() onPressed,
    required color,
    required String path,
    required String payWay,
  }) {
    return AppButton(
      onPressed: onPressed,
      backgroundColor: color,
      borderRadius: radius,
      width: 100.vmin,
      height: 3.125.rem,
      child: AppRow(
        gap: .5.rem,
        children: [
          AppImage(
            path: path,
            width: 3.35938.rem,
            height: 1.25.rem,
          ),
          TextMd.semiBold(
            'Pay With $payWay',
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
