import 'package:auto_route/auto_route.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:edu_track/widgets/search_field.dart';
import 'package:edu_track/widgets/texts/texts.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../constants/ui/colors.dart';
import '../../widgets/app_bars/app_bars.dart';

@RoutePage()
class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: MessageAppBar(),
      body: AppColumn(
        children: [
          AppContainer(
            padding: AppEdgeInsets.only(
              bottom: 2.rem,
              top: 2.rem,
              left: 2.rem,
              right: 1.rem,
            ),
            color: AppColors.brand700,
            child: AppRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDisplayXs.semiBold(
                  'August',
                  color: AppColors.white,
                ),
                AppButton(
                  backgroundColor: AppColors.brand50,
                  borderRadius: AppBorderRadius.all(AppRadius.circular(.5.rem)),
                  onPressed: () {},
                  child: AppRow(
                    gap: .5.rem,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon(
                        icon: AppIcons.plus,
                        color: AppColors.brand700,
                      ),
                      TextSm.semiBold(
                        'Add Task',
                        color: AppColors.brand700,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                AppContainer(
                  child: DatePicker(
                    DateTime.now(),
                    width: 50,
                    height: 90,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.brand700,
                    selectedTextColor: AppColors.white,
                    dateTextStyle: const TextStyle(
                      fontSize: 18,
                      color: AppColors.gray500,
                    ),
                    dayTextStyle: const TextStyle(
                      fontSize: 12,
                      color: AppColors.gray500,
                    ),
                    onDateChange: (selectedDate) {
                      //TODO
                    },
                  ),
                ),
                SearchField(
                  onSubmit: (str) {
                    //TODO
                  },
                ),
                AppSizedBox(
                  width: 100.vw,
                  child: DataTable(
                    sortAscending: true,
                    sortColumnIndex: 0,
                    columns: [
                      DataColumn(
                        label: TextXs.medium('Time'),
                      ),
                      DataColumn(
                        label: TextXs.medium('Classes'),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            AppColumn(
                              children: [
                                TextSm.medium('5:10'),
                                TextSm.regular('PM', color: AppColors.gray600),
                              ],
                            ),
                          ),
                          DataCell(
                            TextSm.medium(
                                'React and Material-UI: Building Bea...'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
