import 'package:edu_track/_main/main.dart';

import './container.dart';

class AppMargin extends AppContainer {
  const AppMargin({
    super.key,
    super.child,
    required AppEdgeInsetsGeometry super.margin,
  });
}
