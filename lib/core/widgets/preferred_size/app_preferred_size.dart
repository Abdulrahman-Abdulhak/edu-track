import 'package:flutter/widgets.dart';

import '../../_main/main.dart';

class AppPreferredSize extends AppStatelessWidget
    implements AppPreferredSizeWidget {
  @override
  final AppSize preferredSize;
  final Widget child;

  const AppPreferredSize({
    super.key,
    required this.preferredSize,
    required this.child,
  });

  @override
  PreferredSizeWidget compute(
    BuildContext context,
    BoxConstraints? constraints,
  ) {
    return PreferredSize(
      preferredSize: preferredSize.compute(context, constraints),
      child: child,
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return preferredSize.needsConstraints(context);
  }
}
