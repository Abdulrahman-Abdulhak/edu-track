import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

class Logo extends StatelessWidget {
  final UnitSize size;

  const Logo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return AppAvatar(
      child: AppImage(
        path: AppImages.appLogo,
        height: size,
        width: size,
      ),
    );
  }
}
