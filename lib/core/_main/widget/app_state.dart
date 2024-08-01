import 'package:flutter/widgets.dart';

//* this class is a replacement of {State<T>}. created for the benefit of
//* using the dynamic units from the {UnitSize} class.
abstract class AppState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    if (needsConstraints(context)) {
      return LayoutBuilder(
        builder: (context, constraints) => awareBuild(context, constraints),
      );
    }

    return awareBuild(context, null);
  }

  Widget awareBuild(BuildContext context, BoxConstraints? constraints);
  bool needsConstraints(BuildContext context);
}
