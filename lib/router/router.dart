import 'package:auto_route/auto_route.dart';

import 'package:edu_track/constants/constants.dart';

import 'router.gr.dart';
export 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen|Page,Route")
class AppRouter extends RootStackRouter {
  static final router = AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: AppRoutes.home,
          initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: '',
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: AppRoutes.signUpPath,
        ),
        AutoRoute(
          page: PaymentRoute.page,
          path: AppRoutes.paymentPath,
        ),
        AutoRoute(
          page: HomeworkAddRoute.page,
          path: TeacherRoutes.homeworkUpload,
        ),
        AutoRoute(
          page: ChatsRoute.page,
          path: AppRoutes.chatsPath,
        ),
        AutoRoute(
          page: MessageChatRoute.page,
          path: AppRoutes.messageChatsPath,
        ),
        AutoRoute(
          page: CalenderRoute.page,
          path: AppRoutes.calenderPath,
          initial: true,
        )
      ];
}
