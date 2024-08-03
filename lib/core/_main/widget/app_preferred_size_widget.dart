import 'package:flutter/material.dart';

import '../math/math.dart';

abstract class AppPreferredSizeWidget implements Widget {
  const AppPreferredSizeWidget();

  AppSize get preferredSize;
}
