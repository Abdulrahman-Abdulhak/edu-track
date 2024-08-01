import './container.dart';
import '../../../_main/main.dart';

class AppPadding extends AppContainer {
  const AppPadding({
    super.key,
    super.child,
    required AppEdgeInsetsGeometry super.padding,
  });
}
