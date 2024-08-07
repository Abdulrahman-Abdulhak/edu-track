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

  static String pathParam(String path) {
    return path.split(':').last;
  }
}

class TeacherRoutes {
  static const homeworkUpload = '/homework-upload';
}
