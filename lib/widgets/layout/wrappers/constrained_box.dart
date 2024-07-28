import 'package:edu_track/_main/main.dart';

import './container.dart';

class AppConstrainedBox extends AppContainer {
  const AppConstrainedBox({
    super.key,
    super.child,
    required AppBoxConstraints constraints,
  });
}
