import 'package:flutter/material.dart';

import 'package:edu_track/_main/main.dart';

class AppPadding extends AppStatelessWidget {
  final Widget? child;
  final AppEdgeInsetsGeometry padding;

  const AppPadding({
    super.key,
    this.child,
    required this.padding,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    return Padding(
      padding: padding.compute(context, constraints),
      child: child,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return padding.needsConstraints;
  }
}
