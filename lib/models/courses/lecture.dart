class Lecture {
  final DateTime? date;
  final bool? finished, isNew;

  final int number;
  final String title;

  const Lecture({
    this.date,
    this.finished,
    this.isNew,
    required this.number,
    String? title,
  }) : title = title ?? "Lecture $number";
}
