import 'package:auto_route/auto_route.dart';

import 'package:edu_track/constants/constants.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen|Page,Route")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignUpRoute.page,
          path: AppRoutes.signUpPath,
        ),
        AutoRoute(
          page: PaymentRoute.page,
          path: AppRoutes.paymentPath,
          initial: true,
        ),
        AutoRoute(
          page: HomeworkAddRoute.page,
          path: TeacherRoutes.homeworkUpload,
        ),
      ];
}
