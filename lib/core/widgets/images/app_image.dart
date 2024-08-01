import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import '../../_main/main.dart';
import '../../utils/utils.dart';

enum _imageType {
  svg('svg'),
  other,
  unknown;

  static _imageType fromString(String str) {
    for (var type in _imageType.values) {
      if (type.name == str) return type;
    }

    return _imageType.other;
  }

  final String? fileSuffix;

  const _imageType([this.fileSuffix]);
}

class AppImage extends AppStatelessWidget {
  final UnitSize? width, height;

  final BoxFit fit;

  final String path;

  const AppImage({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    required this.path,
  });

  _imageType _determineImageType() {
    final suffixIndex = path.lastIndexOf('.') + 1;

    if (suffixIndex == 0 || suffixIndex >= path.length) {
      return _imageType.unknown;
    }

    final suffix = path.substring(suffixIndex);
    return _imageType.fromString(suffix);
  }

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final type = _determineImageType();

    if (type == _imageType.svg) {
      return SvgPicture.asset(
        path,
        fit: fit,
        width: width?.compute(context, constraints),
        height: height?.compute(context, constraints),
      );
    }

    return Image.asset(
      path,
      fit: fit,
      width: width?.compute(context, constraints),
      height: height?.compute(context, constraints),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [width, height].needsConstraints;
  }
}
