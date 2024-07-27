import 'package:edu_track/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/utils/sizes/unit_size.dart';

abstract class AppBorderRadiusGeometry {
  const AppBorderRadiusGeometry();

  BorderRadiusGeometry compute(
    BuildContext? context,
    BoxConstraints? constraints,
  );

  bool get needsContext => UnitSize.anyNeedsConstraints(_properties);
  bool get needsConstraints => UnitSize.anyNeedsContext(_properties);

  List<UnitSize> get _properties;
}

class AppBorderRadius extends AppBorderRadiusGeometry {
  static const AppBorderRadius zero = AppBorderRadius.all(UnitSize.zero);

  final UnitSize topLeft, topRight, bottomRight, bottomLeft;

  const AppBorderRadius.all(UnitSize radius)
      : this.only(
          bottomLeft: radius,
          bottomRight: radius,
          topLeft: radius,
          topRight: radius,
        );

  const AppBorderRadius.vertical({
    UnitSize top = UnitSize.zero,
    UnitSize bottom = UnitSize.zero,
  }) : this.only(
          bottomLeft: bottom,
          bottomRight: bottom,
          topLeft: top,
          topRight: top,
        );

  const AppBorderRadius.horizontal({
    UnitSize left = UnitSize.zero,
    UnitSize right = UnitSize.zero,
  }) : this.only(
          bottomLeft: left,
          topLeft: left,
          bottomRight: right,
          topRight: right,
        );

  const AppBorderRadius.only({
    this.topLeft = UnitSize.zero,
    this.topRight = UnitSize.zero,
    this.bottomRight = UnitSize.zero,
    this.bottomLeft = UnitSize.zero,
  });

  @override
  List<UnitSize> get _properties =>
      [topLeft, topRight, bottomRight, bottomLeft];

  @override
  BorderRadius compute(BuildContext? context, BoxConstraints? constraints) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft.compute(context, constraints)),
      topRight: Radius.circular(topRight.compute(context, constraints)),
      bottomRight: Radius.circular(bottomRight.compute(context, constraints)),
      bottomLeft: Radius.circular(bottomLeft.compute(context, constraints)),
    );
  }
}

class AppBorderRadiusDirectional extends AppBorderRadiusGeometry {
  static const AppBorderRadiusDirectional zero = AppBorderRadiusDirectional.all(
    UnitSize.zero,
  );

  final UnitSize topStart, topEnd, bottomEnd, bottomStart;

  const AppBorderRadiusDirectional.all(UnitSize radius)
      : this.only(
          bottomStart: radius,
          bottomEnd: radius,
          topStart: radius,
          topEnd: radius,
        );

  const AppBorderRadiusDirectional.vertical({
    UnitSize top = UnitSize.zero,
    UnitSize bottom = UnitSize.zero,
  }) : this.only(
          bottomStart: bottom,
          bottomEnd: bottom,
          topStart: top,
          topEnd: top,
        );

  const AppBorderRadiusDirectional.horizontal({
    UnitSize start = UnitSize.zero,
    UnitSize end = UnitSize.zero,
  }) : this.only(
          bottomStart: start,
          topStart: start,
          bottomEnd: end,
          topEnd: end,
        );

  const AppBorderRadiusDirectional.only({
    this.topStart = UnitSize.zero,
    this.topEnd = UnitSize.zero,
    this.bottomEnd = UnitSize.zero,
    this.bottomStart = UnitSize.zero,
  });

  @override
  List<UnitSize> get _properties => [topStart, topEnd, bottomEnd, bottomStart];

  @override
  BorderRadiusDirectional compute(
    BuildContext? context,
    BoxConstraints? constraints,
  ) {
    return BorderRadiusDirectional.only(
      topStart: Radius.circular(topStart.compute(context, constraints)),
      topEnd: Radius.circular(topEnd.compute(context, constraints)),
      bottomEnd: Radius.circular(bottomEnd.compute(context, constraints)),
      bottomStart: Radius.circular(bottomStart.compute(context, constraints)),
    );
  }
}
