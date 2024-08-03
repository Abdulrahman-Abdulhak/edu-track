import 'package:flutter/material.dart';

import '../../layout/layout.dart';
import '../../../_main/main.dart';
import '../../../utils/utils.dart';

class AppAvatar extends StatelessWidget {
  final AppEdgeInsetsGeometry? padding;
  final UnitSize? width, height;

  final Color color;
  final Widget child;

  const AppAvatar({
    super.key,
    this.padding,
    this.width,
    this.height,
    this.color = const Color(0xFF7C7C7C),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final widthToUse = width ?? height;
    final heightToUse = height ?? width;

    return AppContainer(
      padding: padding,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: AppBoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: widthToUse,
      height: heightToUse,
      child: child,
    );
  }
}
