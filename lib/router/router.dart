import 'package:auto_route/auto_route.dart';

import 'package:edu_track/constants/constants.dart';

import 'router.gr.dart';
export 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen|Page,Route")
class AppRouter extends RootStackRouter {
  static final router = AppRouter();

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(
        //   page: MainRoute.page,
        //   path: AppRoutes.main,
        //   initial: true,
        //   children: [
        //     AutoRoute(
        //       initial: true,
        //       page: HomeRoute.page,
        //       path: AppRoutes.initial,
        //     ),
        //     AutoRoute(
        //       page: ChatNavigatorRoute.page,
        //       path: AppRoutes.chatNavigatorPath,
        //       children: [
        //         AutoRoute(
        //           initial: true,
        //           page: ChatsRoute.page,
        //           path: AppRoutes.initial,
        //         ),
        //         AutoRoute(
        //           page: MessageChatRoute.page,
        //           path: AppRoutes.messageChatsPath,
        //         ),
        //       ],
        //     ),
        //     AutoRoute(
        //       page: CalenderRoute.page,
        //       path: AppRoutes.calenderPath,
        //     ),
        //   ],
        // ),
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
          page: HomeworkRoute.page,
          path: AppRoutes.homework,
        ),
        AutoRoute(
          page: HomeworkDetailsRoute.page,
          path: AppRoutes.homeworkDetails,
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: AppRoutes.profile,
          initial: true,
        ),
      ];

  List<PageRouteInfo> get mainTabs => [
        const HomeRoute(),
        const ChatsRoute(),
        CalenderRoute(addTask: false),
      ];
}
