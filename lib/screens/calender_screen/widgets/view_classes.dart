import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

import '../../../constants/ui/colors.dart';
import '../../../widgets/texts/texts.dart';

class ViewClasses extends StatelessWidget {
  const ViewClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSizedBox(
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
                TextSm.medium('React and Material-UI: Building Bea...'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
