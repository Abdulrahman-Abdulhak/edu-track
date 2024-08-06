import 'package:flutter/material.dart';

import '../../layout/layout.dart';
import '../../../_main/main.dart';
import '../../../utils/utils.dart';

const _defaultColor = const Color(0xFF7C7C7C);

class AppAvatar extends StatelessWidget {
  final AppEdgeInsetsGeometry? padding;
  final UnitSize? width, height, borderRadius;
  final Color? color;

  final Widget child;

  const AppAvatar({
    super.key,
    this.padding,
    this.width,
    this.height,
    this.borderRadius,
    this.color = _defaultColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = [width, height].firstWhere(
      (item) => item != null,
      orElse: () => null,
    );
    final widthToUse = width ?? size;
    final heightToUse = height ?? size;

    return IntrinsicHeight(
      child: AppContainer(
        padding: padding,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: AppBoxDecoration(
          borderRadius: AppBorderRadius.circular(borderRadius ?? 100.vmax),
          color: color ?? _defaultColor,
        ),
        width: widthToUse,
        height: heightToUse,
        child: child,
      ),
    );
  }
}
