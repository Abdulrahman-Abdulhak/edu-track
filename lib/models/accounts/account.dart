import 'package:edu_track/core/core.dart';

class Account {
  final String name, email;

  String get initials {
    final words = name.words();
    var current = '';

    if (words.isEmpty) return current;

    current += words.first.firstChar;
    if (words.length > 1) current += words[1].firstChar;

    return current;
  }

  const Account({required this.name, required this.email});
}
