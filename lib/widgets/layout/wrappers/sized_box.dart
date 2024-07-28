import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/utils.dart';

import './container.dart';

class AppSizedBox extends AppContainer {
  const AppSizedBox({super.key, super.width, super.height, super.child});

  const AppSizedBox.expand({super.key, super.child})
      : super(width: UnitSize.infinite, height: UnitSize.infinite);

  const AppSizedBox.shrink({super.key, super.child})
      : super(width: UnitSize.zero, height: UnitSize.zero);

  const AppSizedBox.square({super.key, UnitSize? dimension, super.child})
      : super(width: dimension, height: dimension);

  AppSizedBox.fromSize({super.key, AppSize? size, super.child})
      : super(width: size?.width, height: size?.height);
}
