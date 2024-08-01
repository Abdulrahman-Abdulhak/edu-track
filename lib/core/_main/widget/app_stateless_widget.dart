import 'package:flutter/widgets.dart';

//* this class is a replacement of {StatelessWidget}. created for the benefit of
//* using the dynamic units from the {UnitSize} class.
abstract class AppStatelessWidget extends StatelessWidget {
  const AppStatelessWidget({super.key});

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
