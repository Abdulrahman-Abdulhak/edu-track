import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../text/text.dart';
import '../button/button.dart';
import '../layout/layout.dart';
import '../preferred_size/preferred_size.dart';
import '../../_main/main.dart';
import '../../utils/utils.dart';

class AppHeaderNav extends AppStatelessWidget
    implements AppPreferredSizeWidget {
  final AppEdgeInsetsGeometry? padding;
  final AppTextStyle? titleStyle;

  final UnitSize? height;
  final String? titleText;
  final List<Widget>? actions;
  final Widget? leading, title;
  final AppPreferredSizeWidget? bottom;

  final UnitSize leadingGap, actionsGap, inActionsGap;

  @override
  final AppSize preferredSize;

  AppHeaderNav({
    super.key,
    this.padding,
    this.titleStyle,
    this.height,
    this.titleText,
    this.actions,
    this.leading,
    this.title,
    this.bottom,
    this.leadingGap = const Rem(2),
    this.actionsGap = const Rem(1.25),
    this.inActionsGap = const Rem(1.125),
  }) : preferredSize = _NavPreferredSize(
          height,
          bottom?.preferredSize.height,
        );

  @override
  PreferredSizeWidget compute(
    BuildContext context,
    BoxConstraints? constraints,
  ) {
    Widget title = this.title ?? AppText(titleText!, style: titleStyle);

    final router = context.router;
    Widget? leadingToUse = leading;
    if (leadingToUse == null && router.canPop()) {
      leadingToUse = AppIconButton(
        onPressed: () {
          router.maybePop();
        },
      );
    }

    Widget result = AppRow(
      children: [
        leadingToUse,
        if (leading != null) GapHorizontal(size: leadingGap),
        Expanded(child: title),
        if (actions != null) GapHorizontal(size: actionsGap),
        if (actions != null)
          AppRow(
            mainAxisSize: MainAxisSize.min,
            gap: inActionsGap,
            children: actions!,
          ),
      ],
    );

    if (bottom != null) {
      result = AppColumn(children: [result, bottom]);
    }

    return AppPreferredSize(
      preferredSize: preferredSize,
      child: AppContainer(
        padding: padding ?? AppEdgeInsets.symmetric(horizontal: 1.rem),
        height: preferredSize.height,
        alignment: Alignment.center,
        child: result,
      ),
    ).compute(context, constraints);
  }

  @override
  bool needsConstraints(BuildContext context) {
    return preferredSize.needsConstraints(context);
  }
}

const _defaultNavHeight = Rem(4.5); // 72.px

class _NavPreferredSize extends AppSize {
  _NavPreferredSize(this.navHeight, this.bottomHeight)
      : super.fromHeight(
          (navHeight ?? _defaultNavHeight) + (bottomHeight ?? UnitSize.zero),
        );

  final UnitSize? navHeight, bottomHeight;
}
