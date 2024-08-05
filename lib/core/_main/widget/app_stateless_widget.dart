import 'package:flutter/widgets.dart';

import '../_app_class.dart';

@immutable
abstract class AppWidget extends Widget implements AppClass<Widget> {
  const AppWidget({super.key});

  @override
  Widget compute(BuildContext context, BoxConstraints? constraints);
}

//* this class is a replacement of {StatelessWidget}. created for the benefit of
//* using the dynamic units from the {UnitSize} class.
abstract class AppStatelessWidget extends AppWidget {
  const AppStatelessWidget({super.key});

  @override
  AppStatelessElement createElement() => AppStatelessElement(this);

  @protected
  Widget build(BuildContext context) {
    if (needsConstraints(context)) {
      return LayoutBuilder(
        builder: (context, constraints) => compute(context, constraints),
      );
    }

    return compute(context, null);
  }

  @override
  bool get needsContext => false;
}

class AppStatelessElement extends ComponentElement {
  AppStatelessElement(AppStatelessWidget super.widget);

  @override
  Widget build() => (widget as AppStatelessWidget).build(this);

  @override
  void update(AppStatelessWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild(force: true);
  }
}
