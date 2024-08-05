import 'package:flutter/material.dart';

import './app_stateless_widget.dart';
import '../math/math.dart';

abstract class AppPreferredSizeWidget extends AppWidget {
  const AppPreferredSizeWidget({super.key});

  AppSize get preferredSize;

  @override
  PreferredSizeWidget compute(
    BuildContext context,
    BoxConstraints? constraints,
  );

  @override
  bool needsConstraints(BuildContext context) {
    return preferredSize.needsConstraints(context);
  }

  @override
  bool get needsContext => preferredSize.needsContext;
}
