import './container.dart';
import '../../../_main/main.dart';

class AppConstrainedBox extends AppContainer {
  const AppConstrainedBox({
    super.key,
    super.child,
    required AppBoxConstraints constraints,
  });
}
