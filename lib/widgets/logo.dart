import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class Logo extends StatelessWidget {
  final UnitSize size;

  const Logo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: AppImage(
        path: AppImages.appLogo,
        height: size,
        width: size,
      ),
    );
  }
}
