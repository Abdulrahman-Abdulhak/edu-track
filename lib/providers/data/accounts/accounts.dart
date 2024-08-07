import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:edu_track/models/models.dart';

part 'accounts.g.dart';

@riverpod
List<Account> chats(ChatsRef ref) {
  return const [
    Account(
      id: 0,
      name: "Olivia Rhye",
      email: "email",
      type: UserType.student,
      organization: "LQP Organization",
      messages: 2,
    ),
    Account(
      id: 1,
      name: "Johnny Johan",
      email: "email",
      type: UserType.student,
      organization: "LQP Organization",
    ),
    Account(
      id: 2,
      name: "Olivia Rhye",
      email: "email",
      type: UserType.student,
      organization: "LQP Organization",
    ),
    Account(
      id: 3,
      name: "Phoenix B.",
      email: "email",
      type: UserType.teacher,
      organization: "LQP Organization",
    ),
    Account(
      id: 4,
      name: "Andi Lane",
      email: "email",
      type: UserType.manager,
      organization: "NOP Organization",
    ),
    Account(
      id: 5,
      name: "Natalia Postman",
      email: "email",
      type: UserType.parent,
      organization: "NOP Organization",
    ),
    Account(
      id: 6,
      name: "Malia R.",
      email: "email",
      type: UserType.student,
      organization: "NOP Organization",
    ),
  ];
}

@riverpod
Account userChat(UserChatRef ref, int id) {
  final chatUsers = ref.watch(chatsProvider);
  return chatUsers.firstWhere((account) => account.id == id);
}
