import "package:flutter/material.dart";

class ImageAsset extends StatelessWidget {
  const ImageAsset(
      {super.key,
      required this.imageName,
      required this.width,
      required this.height});
  final String imageName;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageName,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
