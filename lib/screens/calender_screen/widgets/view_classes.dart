import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:edu_track/constants/constants.dart';

final _now = DateTime.now();
final _courses = [
  Course(
    professor: const Account(
      id: 10001,
      name: "Mohamad Hamda",
      email: "MohamadHamda@gmail.com",
      type: UserType.teacher,
      organization: "LQP Organization",
    ),
    title: "Number Theory: Prime Numbers and Cryptography",
    type: CourseType.mathematics,
    organization: const Account(
      id: 10002,
      name: "LQP Organization",
      email: "LQPOrganization@gmail.com",
      type: UserType.organization,
    ),
    time: _now.add(5.h),
    signupDate: _now.subtract(5.day),
    lectures: [
      const Lecture(number: 1, finished: true),
      const Lecture(number: 2, finished: true),
      const Lecture(number: 3),
      const Lecture(number: 4),
      const Lecture(number: 5),
      const Lecture(number: 6),
      Lecture(number: 7, date: _now.subtract(30.minute)),
    ],
  ),
  Course(
    professor: const Account(
      id: 20001,
      name: "Abdulrhman Abdullah",
      email: "Prof.AbdulrhmanAbdullah@gmail.com",
      type: UserType.teacher,
      organization: "LQP Organization",
    ),
    title: "Software Engineering: Principles and Practices",
    type: CourseType.computer,
    organization: const Account(
      id: 20002,
      name: "LQP Organization",
      email: "LQPOrganization@gmail.com",
      type: UserType.organization,
    ),
    time: _now.add(5.h),
    signupDate: _now.subtract(2.day),
    lectures: [
      const Lecture(number: 1),
      const Lecture(number: 2),
      const Lecture(number: 3),
      const Lecture(number: 4),
      Lecture(
        number: 5,
        date: _now.subtract(7.h),
        isNew: true,
      ),
    ],
    next: [
      Lecture(
        number: 5,
        date: _now.add(7.h),
        isNew: true,
      ),
      Lecture(
        number: 5,
        date: _now.add(3.day),
        isNew: true,
      ),
    ],
  ),
];

class ViewClasses extends StatelessWidget {
  final DateTime date;
  const ViewClasses({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final courses = _courses
        .where(
          (course) => course.next != null && course.next!.isNotEmpty,
        )
        .toList();
    final lectures = courses
        .to((course) => course.next!)
        .flatten()
        .where((lecture) => lecture.date!.isInDay(date))
        .toList();

    return AppListView(
      // width: 100.vw,
      children: [
        DataTable(
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
          dataRowHeight: 8.5.rem.compute(context, null), //TODO: deal with this.
          horizontalMargin: 0,
          border: const TableBorder(
            horizontalInside: BorderSide(color: AppColors.gray200),
          ),
          rows: lectures.to(
            (lecture) {
              final course = courses.firstWhere(
                (course) => course.next!.contains(lecture),
              );
              final hour = lecture.date!.hourString;

              return DataRow(
                cells: [
                  DataCell(
                    AppContainer(
                      padding: AppEdgeInsets.only(top: 2.rem),
                      alignment: Alignment.topCenter,
                      child: AppColumn(
                        children: [
                          TextSm.medium(
                            hour.substring(0, hour.length - 2),
                            color: AppColors.gray900,
                          ),
                          TextSm.regular(
                            hour.substring(hour.length - 2),
                            color: AppColors.gray600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    AppPadding(
                      padding: AppEdgeInsetsDirectional.only(
                        top: 1.rem,
                        bottom: 1.rem,
                        end: 1.5.rem,
                      ),
                      child: AppRow(
                        gap: .75.rem,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: AppBadge(
                              borderRadius: AppBorderRadius.circular(4.px),
                              color: course.type.color[100],
                              padding: AppEdgeInsets.all(5.px),
                              child: AppIcon(
                                icon: course.type.icon,
                                size: 2.5.rem - 5.px,
                                color: course.type.color[600],
                              ),
                            ),
                          ),
                          AppColumn(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSm.medium(
                                course.label,
                                color: AppColors.brand700,
                              ),
                              TextSm.medium(
                                lecture.title,
                                color: AppColors.gray500,
                                overflow: TextOverflow.ellipsis,
                                maxLineCount: 2,
                              ),
                              GapVertical(size: .25.rem),
                              DateTag(date: lecture.date!),
                              OrganizationBadge(account: course.organization),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
