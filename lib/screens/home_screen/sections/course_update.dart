import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';

import '../widgets/widgets.dart';

final _now = DateTime.now();
final _courses = [
  Course(
    professor: const Account(
      name: "Mohamad Hamda",
      email: "MohamadHamda@gmail.com",
      type: UserType.teacher,
      organization: "LQP Organization",
    ),
    title: "Number Theory: Prime Numbers and Cryptography",
    type: CourseType.mathematics,
    organization: const Account(
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
      name: "Abdulrhman Abdullah",
      email: "Prof.AbdulrhmanAbdullah@gmail.com",
      type: UserType.teacher,
      organization: "LQP Organization",
    ),
    title: "Software Engineering: Principles and Practices",
    type: CourseType.computer,
    organization: const Account(
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
  ),
];

class CoursesUpdate extends StatelessWidget {
  final Account user;
  final UnitSize inlinePadding;

  const CoursesUpdate({
    super.key,
    required this.user,
    required this.inlinePadding,
  });

  @override
  Widget build(BuildContext context) {
    final courses = _courses
        .where(
          (course) =>
              AppObject.toBool(course.lectures) &&
              course.lectures!.any(
                (lecture) => AppObject.toBool(lecture.isNew),
              ),
        )
        .toList();

    return CardsList(
      listHeight: 14.875.rem,
      indentation: AppEdgeInsets.symmetric(horizontal: inlinePadding),
      name: "Latest Courses Update",
      onSeeMore: () {
        //TODO: implement.
      },
      cardCount: courses.length,
      cardBuilder: (context, index) {
        return UpdatedCard(course: courses[index], cardWidth: 14.rem);
      },
    );
  }
}
