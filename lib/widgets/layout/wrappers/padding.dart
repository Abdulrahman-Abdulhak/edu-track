import 'package:edu_track/_main/main.dart';

import './container.dart';

class AppPadding extends AppContainer {
  const AppPadding({
    super.key,
    super.child,
    required AppEdgeInsetsGeometry super.padding,
  });
}
