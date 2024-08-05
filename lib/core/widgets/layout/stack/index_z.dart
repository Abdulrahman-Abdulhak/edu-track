import 'package:flutter/material.dart';

// this class is used to make the child on the [index] level of the [AppStack].
// normally widgets other than the [IndexZ] and [AppPositioned] would be
// displayed in the level 0 of the [AppStack]
class IndexZ extends StatelessWidget {
  final int index;
  final Widget child;

  const IndexZ({
    super.key,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
