import 'package:education_app/presentation/pages/course/course_page.dart';
import 'package:education_app/presentation/pages/home/home_page.dart';
import 'package:education_app/presentation/pages/welcome/welcome_page.dart';
import 'package:education_app/presentation/route/route_name.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  final pages = GoRouter(initialLocation: RouteName.welcome, routes: [
    GoRoute(
        path: RouteName.welcome,
        name: RouteName.welcome,
        builder: (context, state) => WelcomePage(),
        routes: [
          GoRoute(
            path: RouteName.homePage,
            name: RouteName.homePage,
            builder: (context, state) => HomePage(),
          ),
          GoRoute(
            path: '${RouteName.coursePage}/:name',
            name: RouteName.coursePage,
            builder: (context, state) =>
                CoursePage(name: state.pathParameters['name']),
          ),
        ]),
  ]);
}
