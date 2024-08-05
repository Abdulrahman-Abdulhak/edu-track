import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

import './index_z.dart';
import './app_positioned.dart';

class AppStack extends StatelessWidget {
  final TextDirection? textDirection;

  final AlignmentGeometry alignment;
  final Clip clipBehavior;
  final StackFit fit;

  final List<Widget> children;

  const AppStack({
    super.key,
    this.textDirection,
    this.alignment = AlignmentDirectional.topStart,
    this.clipBehavior = Clip.none,
    this.fit = StackFit.loose,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      clipBehavior: clipBehavior,
      fit: fit,
      textDirection: textDirection,
      children: _reorderStack(),
    );
  }

  List<Widget> _reorderStack() {
    final pairs = <MapEntry<int, Widget>>[];

    for (var child in children) {
      var key = 0; // for normal children

      if (child is IndexZ) key = child.index;
      if (child is AppPositioned) key = child.zIndex ?? 0;

      pairs.add(MapEntry(key, child));
    }

    return (pairs..sort((a, b) => a.key.compareTo(b.key)))
        .toList()
        .to((pair) => pair.value); // transform the pairs to children
  }
}
