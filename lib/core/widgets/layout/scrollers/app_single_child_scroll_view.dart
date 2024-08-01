import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../_main/main.dart';
import '../../../utils/utils.dart';

class AppSingleChildScrollView extends AppStatelessWidget {
  final AppEdgeInsetsGeometry? padding;

  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool? primary;
  final String? restorationId;
  final Widget? child;

  final Clip clipBehavior;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final bool reverse;
  final Axis scrollDirection;

  const AppSingleChildScrollView({
    super.key,
    this.padding,
    this.controller,
    this.physics,
    this.primary,
    this.restorationId,
    this.child,
    this.clipBehavior = Clip.hardEdge,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    return SingleChildScrollView(
      padding: padding?.compute(context, constraints),
      controller: controller,
      physics: physics,
      primary: primary,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      reverse: reverse,
      scrollDirection: scrollDirection,
      child: child,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [padding].needsConstraints;
  }
}
