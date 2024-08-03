import 'package:edu_track/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return AppRow(
      gap: 1.5.rem,
      children: [
        Stack(
          children: [
            AppContainer(
              width: 3.5.rem,
              height: 3.5.rem,
              clipBehavior: Clip.antiAlias,
              decoration: const AppBoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
            !active
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: activeStatus(),
                  )
                : Container(),
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
      ),
    );
  }
}
