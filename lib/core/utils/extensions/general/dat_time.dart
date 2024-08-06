import 'package:flutter/widgets.dart';

import './int.dart';

extension AppDateTime on DateTime {
  static List<int> months30() {
    return const [
      DateTime.april,
      DateTime.june,
      DateTime.september,
      DateTime.november,
    ];
  }

  static List<int> months31() {
    return const [
      DateTime.january,
      DateTime.march,
      DateTime.may,
      DateTime.july,
      DateTime.august,
      DateTime.october,
      DateTime.december,
    ];
  }

  static List<int> monthsWithDays(int days, [bool exact = true]) {
    if (days == 31) return months31();

    if (exact) {
      if (days == 30) return months30();
      if ([29, 28].contains(days)) return const [DateTime.february];
    }

    if (days > 31) return const [];
    if (days == 30) return [...months30(), ...months31()]..sort();

    return [...months30(), ...months31(), DateTime.february]..sort();
  }

  static int daysInMonth(int month, [int? year]) {
    if (months31().contains(month)) return 31;
    if (months30().contains(month)) return 30;
    if (month == DateTime.february) {
      if (year != null && isLeapYear(year)) return 29;
      return 28;
    }

    return 0;
  }

  static bool isLeapYear(int year) {
    if (year.devisableBy(100)) {
      return year.devisableBy(400);
    }

    return year.devisableBy(4);
  }

  bool isLeap() => isLeapYear(year);

  DateTime get dayStart => DateTime(year, month, day);
  DateTime get weekStart => subtract(Duration(days: weekday - 1)).dayStart;
  DateTime get monthStart => DateTime(year, month);
  DateTime get yearStart => DateTime(year);
  // TODO: implement.
  // DateTime get decadeStart => after(const Duration(days: 3650)).yearStart;
  // DateTime get centuryStart => after(const Duration(days: 36500)).yearStart;

  DateTime get dayEnd => DateTime(year, month, day, 23, 59, 59, 999, 999);
  DateTime get weekEnd => subtract(Duration(days: 7 - weekday)).dayEnd;
  DateTime get monthEnd => DateTime(year, month, daysInMonth(month)).dayEnd;
  DateTime get yearEnd => DateTime(year, 12, 31).dayEnd;
  // TODO: Implement.
  // DateTime get decadeEnd => after(const Duration(days: 3650)).yearEnd;
  // DateTime get centuryEnd => after(const Duration(days: 36500)).yearEnd;

  DateTime get nextDay => add(const Duration(days: 1));
  DateTime get nextWeek => add(const Duration(days: 7));
  DateTime get nextMonth => add(Duration(days: daysInMonth(month + 1)));
  DateTime get nextYear => copyWith(year: year + 1);
  DateTime get nextDecade => copyWith(year: year + 10);
  DateTime get nextCentury => copyWith(year: year + 100);

  DateTime get lastDay => subtract(const Duration(days: 1));
  DateTime get lastWeek => subtract(const Duration(days: 7));
  DateTime get lastMonth => subtract(Duration(days: daysInMonth(month + 1)));
  DateTime get lastYear => copyWith(year: year - 1);
  DateTime get lastDecade => copyWith(year: year - 10);
  DateTime get lastCentury => copyWith(year: year - 100);

  String toStringFrom(DateTime date, BuildContext context) {
    final difference = date.difference(this);
    final days = difference.inDays;

    if (days >= 365) return "${(days / 365).floor()}y ago";
    if (days >= 30) return "${(days / 30).floor()}mon ago";
    if (days >= 7) return "${(days / 7).floor()}w ago";
    if (days > 0) return "${days}day ago";

    if (difference.inHours > 0) return "${difference.inHours}h ago";
    if (difference.inMinutes > 0) return "${difference.inMinutes}min ago";
    return "${difference.inSeconds}sec ago";
  }

  String toStringFromNow(BuildContext context) {
    return toStringFrom(DateTime.now(), context);
  }

  String toStringUntil(DateTime date, BuildContext context) {
    final difference = this.difference(date);
    final days = difference.inDays;

    if (days >= 365) return "${(days / 365).floor()}y left";
    if (days >= 30) return "${(days / 30).floor()}mon left";
    if (days >= 7) return "${(days / 7).floor()}w left";
    if (days > 0) return "${days}d left";

    if (difference.inHours > 0) return "${difference.inHours}h left";
    if (difference.inMinutes > 0) return "${difference.inMinutes}min left";
    return "${difference.inSeconds}sec left";
  }

  String toStringUntilNow(BuildContext context) {
    return toStringUntil(DateTime.now(), context);
  }

  bool isDate(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day &&
        hour == other.hour &&
        minute == other.minute &&
        second == other.second &&
        millisecond == other.millisecond &&
        microsecond == other.microsecond;
  }

  bool isInYear(DateTime other) {
    return yearStart.isDate(other.yearStart);
  }

  bool isInMonth(DateTime other) {
    return monthStart.isDate(other.monthStart);
  }

  bool isInWeek(DateTime other) {
    return weekStart.isDate(other.weekStart);
  }

  bool isInDay(DateTime other) {
    return dayStart.isDate(other.dayStart);
  }

  String dayName(BuildContext context) {
    return switch (weekday) {
      DateTime.sunday => "sunday",
      DateTime.monday => "monday",
      DateTime.tuesday => "tuesday",
      DateTime.wednesday => "wednesday",
      DateTime.thursday => "thursday",
      DateTime.friday => "friday",
      DateTime.saturday => "saturday",
      _ => "unknown",
    };
  }

  String toStringWhen(DateTime other, BuildContext context) {
    final difference = other.difference(this);

    final isAm = 0 <= other.hour && other.hour < 12;
    final hour = other.hour == 0
        ? 12
        : other.hour > 12
            ? other.hour - 12
            : other.hour;
    final minute = other.minute;
    final hourString = "$hour:$minute${isAm ? "AM" : "PM"}";

    if (isInDay(other)) return "today, at $hourString";
    if (isInWeek(other)) {
      if (difference.inDays == 1) return "tomorrow, at $hourString";
      return "${other.dayName(context)}, at $hourString";
    }

    return ""; //TODO: implement rest.
  }
}
