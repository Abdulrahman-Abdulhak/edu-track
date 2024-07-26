import 'package:edu_track/constants/ui/images.dart';
import 'package:edu_track/widgets/images/asset_image.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.size, required this.alignment});
  final double size;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ImageAsset(
        imageName: AppLogo.logo,
        height: size,
        width: size,
      ),
    );
  }
}
