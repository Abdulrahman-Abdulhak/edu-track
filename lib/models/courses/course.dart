import 'dart:ui';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/constants/constants.dart';

import '../accounts/accounts.dart';
import './lecture.dart';

enum CourseType {
  chemistry(AppIcons.chemistry, AppColors.orange, "chemistry"),
  computer(AppIcons.computerChip, AppColors.error, "computer science"),
  mathematics(AppIcons.mathXY, AppColors.success, "mathematics"),
  languageFrench(AppIcons.languageFrench, AppColors.pink, "french language"),
  ;

  final AppIcons icon;
  final Map<int, Color> color;
  final String _label;

  const CourseType(this.icon, this.color, this._label);

  String get label => _label.capitalizeWord();
}

class Course {
  final List<Lecture>? lectures, next;
  final Duration? duration;

  final String title;
  final CourseType type;
  final Account professor, organization;
  final DateTime time, signupDate;

  const Course({
    this.duration,
    this.lectures,
    this.next,
    required this.title,
    required this.type,
    required this.professor,
    required this.organization,
    required this.time,
    required this.signupDate,
  });

  String get label => type.label;
}
