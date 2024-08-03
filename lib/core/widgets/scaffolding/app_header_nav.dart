import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../text/text.dart';
import '../button/button.dart';
import '../layout/layout.dart';
import '../../_main/main.dart';
import '../../utils/utils.dart';

//TODO: make it implements AppPreferredSizeWidget
class AppHeaderNav extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final String? titleText;
  final List<Widget>? actions;
  final Widget? leading, title;
  final AppTextStyle? titleStyle;
  final PreferredSizeWidget? bottom;

  final UnitSize leadingGap, actionsGap, inActionsGap;

  @override
  final Size preferredSize;

  AppHeaderNav({
    super.key,
    this.height,
    this.titleText,
    this.actions,
    this.leading,
    this.title,
    this.titleStyle,
    this.bottom,
    this.leadingGap = const Rem(2),
    this.actionsGap = const Rem(1.25),
    this.inActionsGap = const Rem(1.125),
  })  : assert(
          AppObject.xor(titleText, title),
          "titleText and title can't be null nor be specified at the same time.",
        ),
        preferredSize = _NavPreferredSize(height, bottom?.preferredSize.height);

  @override
  Widget build(BuildContext context) {
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

    return AppSizedBox(
      height: preferredSize.height.px,
      child: result,
    );
  }
}

const _defaultNavHeight = 72;

//TODO: make it extends AppSize
class _NavPreferredSize extends Size {
  _NavPreferredSize(this.navHeight, this.bottomHeight)
      : super.fromHeight(
          (navHeight ?? _defaultNavHeight) + (bottomHeight ?? 0),
        );

  final double? navHeight, bottomHeight;
}
