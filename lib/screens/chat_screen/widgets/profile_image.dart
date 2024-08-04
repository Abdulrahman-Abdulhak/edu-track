import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

class ProfileImage extends StatelessWidget {
  final bool active = true;
  final Account account;

  const ProfileImage({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return AppRow(
      children: [
        //TODO: implement AppStack.
        Stack(
          children: [
            AccountImage(account: account),
            if (active)
              Positioned(
                bottom: 0,
                right: 0,
                child: activeStatus(),
              )
          ],
        ),
      ],
    );
  }

  Widget activeStatus() {
    return AppContainer(
      width: 0.875.rem,
      height: 0.875.rem,
      clipBehavior: Clip.antiAlias,
      decoration: const AppBoxDecoration(
        color: AppColors.success500,
        shape: BoxShape.circle,
        border: AppBorder.fromBorderSide(
          AppBorderSide(color: AppColors.white, width: Pixel(1.5)),
        ),
      ),
    );
  }
}
