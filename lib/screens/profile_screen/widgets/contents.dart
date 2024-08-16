import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Contents extends StatelessWidget {
  const Contents({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRow(
      children: [
        SvgPicture.asset(AppImages.whatsapp),
        GapHorizontal(size: 0.25.rem),
        SvgPicture.asset(AppImages.telegram),
        GapHorizontal(size: 0.75.rem),
        GestureDetector(
          onTap: () {},
          child: AppContainer(
            height: 1.5.rem,
            width: 1.5.rem,
            clipBehavior: Clip.antiAlias,
            decoration: AppBoxDecoration(
              shape: BoxShape.circle,
              border: AppBorder.all(
                color: AppColors.gray300,
              ),
            ),
            child: AppIcon(
              icon: AppIcons.plus,
              color: AppColors.gray400,
              size: 1.rem,
            ),
          ),
        ),
      ],
    );
  }
}
