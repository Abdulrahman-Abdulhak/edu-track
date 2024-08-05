import 'package:auto_route/auto_route.dart';
import 'package:edu_track/widgets/search_field.dart';
import 'package:edu_track/widgets/texts/texts.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../constants/ui/colors.dart';
import '../../widgets/app_bars/app_bars.dart';
import 'sections/top_section.dart';
import 'widgets/select_date.dart';
import 'widgets/view_classes.dart';

@RoutePage()
class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: MessageAppBar(),
      body: AppColumn(
        children: [
          const TopSection(),
          AppContainer(
            padding: AppEdgeInsets.only(top: 2.rem, left: 1.rem, right: 1.rem),
            decoration: AppBoxDecoration(
              borderRadius: AppBorderRadius.only(
                topLeft: AppRadius.circular(2.rem),
                topRight: AppRadius.circular(2.rem),
              ),
            ),
            child: AppColumn(
              gap: 2.rem,
              children: [
                const SelectDate(),
                SearchField(
                  onSubmit: (str) {
                    //TODO
                  },
                ),
                ViewClasses(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
