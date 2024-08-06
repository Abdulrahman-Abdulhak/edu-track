import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

import './widgets/widgets.dart';
import './sections/sections.dart';

// TODO: Resume working on add task screen.

@RoutePage()
class CalenderScreen extends StatefulWidget {
  final bool addTask;
  const CalenderScreen({super.key, required this.addTask});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  bool addTask = false;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    addTask = widget.addTask;
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppColors.brand700,
      child: AppColumn(
        children: [
          TopSection(
            addTaskMode: addTask,
            date: selectedDate,
            onAddTaskPressed: () {
              // TODO: implement.
            },
          ),
          Expanded(
            child: AppContainer(
              padding: AppEdgeInsets.only(
                top: 2.rem,
                left: 1.rem,
                right: 1.rem,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: AppBoxDecoration(
                color: AppColors.white,
                borderRadius: AppBorderRadius.only(
                  topLeft: AppRadius.circular(2.rem),
                  topRight: AppRadius.circular(2.rem),
                ),
              ),
              child: AppColumn(
                gap: 2.rem,
                children: [
                  SelectDate(onDateChange: (selectedDate) {
                    setState(() {
                      this.selectedDate = selectedDate;
                    });
                  }),
                  if (!addTask) ...[
                    SearchField(
                      contentPadding: AppEdgeInsets.symmetric(
                        vertical: .5.rem,
                        horizontal: .875.rem,
                      ),
                      onSubmit: (str) {
                        //TODO: implement.
                      },
                      filterAction: () {
                        //TODO: implement.
                      },
                    ),
                    Expanded(child: ViewClasses(date: selectedDate)),
                  ] else ...[
                    const AppDivider(color: AppColors.gray200),
                    AppTextField(
                      validator: (text) => text.isNotEmpty,
                      onSubmit: (p0) {
                        //TODO: implement.
                      },
                      decoration: AppInputDecoration(
                        contentPadding: AppEdgeInsets.symmetric(
                          vertical: .625.rem,
                          horizontal: .875.rem,
                        ),
                        hintText: "What is your event?",
                        border: AppOutlineInputBorder(
                          borderRadius: AppBorderRadius.circular(8.px),
                          borderSide: const AppBorderSide(
                            color: AppColors.gray300,
                          ),
                        ),
                        errorBorder: AppOutlineInputBorder(
                          borderRadius: AppBorderRadius.circular(8.px),
                          borderSide: const AppBorderSide(
                            color: AppColors.error300,
                          ),
                        ),
                        label: TextSm.medium(
                          "Event's Name",
                          color: AppColors.gray900,
                        ),
                        labelGap: .375.rem,
                        errorSuffixIcon: const AppIcon(
                          icon: AppIcons.alertCircle,
                          color: AppColors.error500,
                          size: Rem(1),
                        ),
                      ),
                    ),
                    AppDropdownMenu(
                      width: 100.vw - 2.rem,
                      hintText: "Select Reminder Time",
                      label: TextSm.medium(
                        "Reminder",
                        color: AppColors.gray900,
                      ),
                      dropdownMenuEntries: [],
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
