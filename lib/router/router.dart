import 'package:flutter_template/usecases/app/view/app_director.dart';
import 'package:flutter_template/usecases/category_detail/category_detail.dart';
import 'package:flutter_template/usecases/home/view/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String appDirector = 'appDirector';
  static const String appDirectorPath = '/';

  static const String homeNamed = 'home';
  static const String homePath = '/';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: appDirector,
        path: appDirectorPath,
        builder: (context, state) {
          return const AppDirector();
        },
      ),
      GoRoute(
        name: homeNamed,
        path: homePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: '/category',
        path: '/category/:categoryId',
        builder: (context, state) => CategoryDetailPage(
          categoryId: state.pathParameters['categoryId']!,
        ),
      )
    ],
  );
}
