import 'package:flutter/widgets.dart';

import '../icons/icons.dart';
import '../layout/layout.dart';
import '../../_main/main.dart';
import '../../utils/utils.dart';
import '../../types/types.dart';

class AppIconButton extends StatelessWidget {
  final AppIcons? icon;
  final UnitSize? size;
  final Color? iconColor, color;
  final AppEdgeInsetsGeometry? padding;
  final AppBoxBorder? border;
  final AppBorderRadiusGeometry? borderRadius;
  final Widget? child;

  final VoidFunction onPressed;

  const AppIconButton({
    super.key,
    this.icon,
    this.size,
    this.iconColor,
    this.color,
    this.padding,
    this.border,
    this.borderRadius,
    this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final child = this.child ??
        AppIcon(
          icon: icon!,
          size: size,
          color: iconColor,
        );

    final paddingToUse = padding ?? AppEdgeInsets.all(6.px);
    final borderRadiusToUse =
        borderRadius ?? AppBorderRadius.circular(100.vmax);

    return AppContainer(
      clipBehavior: Clip.antiAlias,
      decoration: AppBoxDecoration(
        color: color,
        border: border,
        borderRadius: borderRadiusToUse,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: AppPadding(
          padding: paddingToUse,
          child: child,
        ),
      ),
    );
  }
}
