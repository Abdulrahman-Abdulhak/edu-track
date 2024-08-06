import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../../constants/ui/colors.dart';

class SelectDate extends StatelessWidget {
  final void Function(DateTime selectedDate) onDateChange;

  const SelectDate({super.key, required this.onDateChange});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      //TODO: recreate it in another way.
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
        onDateChange: onDateChange,
      ),
    );
  }
}
