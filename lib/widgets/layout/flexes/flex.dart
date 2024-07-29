import 'package:flutter/material.dart';

import 'package:edu_track/utils/utils.dart';

import './gap.dart';
import './gap_horizontal.dart';
import './gap_vertical.dart';

//* new Flex widget with additional property of {gap}.
//* specifying this property will create gaps in the direction of the Flex.
class AppFlex extends StatelessWidget {
  final UnitSize? gap;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;

  final Axis direction;
  final List<Widget?> children;

  const AppFlex({
    super.key,
    this.gap,
    this.textBaseline,
    this.textDirection,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    required this.direction,
    required this.children,
  });

  List<Widget> _children(List<Widget?> children) {
    var newChildren = children.removeNulls();

    if (gap != null) {
      newChildren = newChildren.fillBetween(
        Gap(direction: direction, size: gap!),
        [Gap, GapHorizontal, GapVertical, Spacer],
      );
    }

    return newChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      direction: direction,
      children: _children(children),
    );
  }
}
