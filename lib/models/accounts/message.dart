import './account.dart';

class Message {
  final String text;
  final DateTime date;
  final Account sender;

  const Message({
    required this.text,
    required this.date,
    required this.sender,
  });
}
