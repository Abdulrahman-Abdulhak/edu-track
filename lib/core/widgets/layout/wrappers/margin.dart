import './container.dart';
import '../../../_main/main.dart';

class AppMargin extends AppContainer {
  const AppMargin({
    super.key,
    super.child,
    required AppEdgeInsetsGeometry super.margin,
  });
}
