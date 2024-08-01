import 'package:flutter/widgets.dart';

import '../../../_main/main.dart';
import '../../../utils/utils.dart';

class AppContainer extends AppStatelessWidget {
  final AppBoxConstraints? constraints;
  final AppBoxDecoration? decoration, foregroundDecoration;
  final AppEdgeInsetsGeometry? margin, padding;
  final UnitSize? height, width;

  final Alignment? alignment;
  final Color? color;
  // final Matrix4? transform;
  final Widget? child;

  final Clip clipBehavior;

  const AppContainer({
    super.key,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.alignment,
    this.color,
    this.child,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    //TODO: Implement AppMatrix4 for the tranform property.
    //TODO: add the rest of the Container properties.
    return Container(
      constraints: this.constraints?.compute(context, constraints),
      decoration: decoration?.compute(context, constraints),
      foregroundDecoration: foregroundDecoration?.compute(context, constraints),
      margin: margin?.compute(context, constraints),
      padding: padding?.compute(context, constraints),
      height: height?.compute(context, constraints),
      width: width?.compute(context, constraints),
      alignment: alignment,
      clipBehavior: clipBehavior,
      color: color,
      child: child,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [height, width].needsConstraints ||
        AppClass.anyNeedsConstraints([
          constraints,
          decoration,
          foregroundDecoration,
          margin,
          padding,
        ]);
  }
}
