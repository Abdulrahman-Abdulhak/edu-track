class AppRoutes {
  static const initial = '';

  static const main = '/';
  // sub paths of main. thus why we didn't prefix them with /
  static const home = '';

  static const chatNavigatorPath = 'chat';
  static const messageChatsPath = ':id';

  static const calenderPath = 'calender';

  // new screens
  static const signUpPath = '/sign-up';
  static const paymentPath = '/payment';
  static const homework = '/homework';
  static const homeworkDetails = '/homeworkDetails';
  static const profile = '/profile';

  static bool isPath(String path, RegExp pattern, [bool exact = false]) {
    if (exact) return path.replaceFirst(pattern, '').isEmpty;
    return pattern.matchAsPrefix(path) != null;
  }

  static bool isInMessagesPath(String path, [bool exact = true]) {
    const regex = r'/chat/[0-9]*';
    return isPath(path, RegExp(regex, caseSensitive: false), exact);
  }
}

class TeacherRoutes {
  static const homeworkUpload = '/homework-upload';
}
