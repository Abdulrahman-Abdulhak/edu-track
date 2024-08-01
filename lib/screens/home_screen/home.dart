import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../constants/ui/colors.dart';
import '../../widgets/texts/text/md.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppRow(
          mainAxisSize: MainAxisSize.min,
          gap: .5.rem,
          children: [
            Logo(size: 1.5.em),
            TextMd.semiBold("EduTrack"),
          ],
        ),
        actions: [
          AppIcon(
            icon: AppIcons.notification,
            color: AppColors.gray700,
            size: 1.5.rem,
          ),
          GapHorizontal(size: 0.5.rem),
          AppIcon(
            icon: AppIcons.menuSolid,
            color: AppColors.gray700,
            size: 1.5.rem,
          ),
          GapHorizontal(size: 0.75.rem),
        ],
      ),
    );
  }
}
