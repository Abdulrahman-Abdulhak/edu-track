import 'package:edu_track/core/core.dart';

enum UserType {
  student,
  teacher,
  manager,
  parent,
  organization,
}

class Account {
  final String name, email;
  final UserType type;

  final String? organization;

  String get initials {
    final words = name.words();
    var current = '';

    if (words.isEmpty) return current;

    current += words.first.firstChar;
    if (words.length > 1) current += words[1].firstChar;

    return current;
  }

  const Account({
    this.organization,
    required this.name,
    required this.email,
    required this.type,
  }) : assert(type == UserType.organization || organization != null);
}
