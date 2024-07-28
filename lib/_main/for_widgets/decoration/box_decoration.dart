import 'package:flutter/widgets.dart';

import 'package:edu_track/utils/utils.dart';

import '../../_app_class.dart';
import '../paint/paint.dart';
import '../borders/borders.dart';

class AppBoxDecoration implements AppClass<BoxDecoration> {
  final AppBoxBorder? border;
  final AppBorderRadiusGeometry? borderRadius;
  final List<AppBoxShadow>? shadows;

  final BlendMode? backgroundBlendMode;
  final Color? color;
  final Gradient? gradient;
  final DecorationImage? image;

  final BoxShape shape;

  const AppBoxDecoration({
    this.backgroundBlendMode,
    this.border,
    this.borderRadius,
    this.shadows,
    this.color,
    this.gradient,
    this.image,
    this.shape = BoxShape.rectangle,
  });

  AppBoxDecoration.fromOrigin(BoxDecoration decoration)
      : this(
          backgroundBlendMode: decoration.backgroundBlendMode,
          border: AppBoxBorder.fromOrigin(decoration.border),
          borderRadius: AppBorderRadiusGeometry.fromOrigin(
            decoration.borderRadius,
          ),
          color: decoration.color,
          gradient: decoration.gradient,
          image: decoration.image,
          shadows: AppClass.fromList(
            decoration.boxShadow,
          ) as List<AppBoxShadow>,
          shape: decoration.shape,
        );

  @override
  BoxDecoration compute(BuildContext? context, BoxConstraints? constraints) {
    return BoxDecoration(
      border: border?.compute(context, constraints),
      borderRadius: borderRadius?.compute(context, constraints),
      boxShadow: shadows?.compute(context, constraints) as List<BoxShadow>,
      backgroundBlendMode: backgroundBlendMode,
      color: color,
      gradient: gradient,
      image: image,
      shape: shape,
    );
  }

  @override
  bool get needsConstraints =>
      AppClass.anyNeedsConstraints([border, borderRadius]) ||
      shadows != null && shadows!.needsConstraints;

  @override
  bool get needsContext =>
      AppClass.anyNeedsContext([border, borderRadius]) ||
      shadows != null && shadows!.needsContext;
}
