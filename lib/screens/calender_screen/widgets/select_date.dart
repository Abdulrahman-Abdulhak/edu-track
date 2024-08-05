import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../../constants/ui/colors.dart';

class SelectDate extends StatelessWidget {
  const SelectDate({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
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
    );
  }
}
