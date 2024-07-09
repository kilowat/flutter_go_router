import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/news_detail_screen.dart';
import 'package:flutter_application_1/screens/news_screen.dart';
import 'package:flutter_application_1/screens/users_screen.dart';
import 'package:flutter_application_1/widgets/scaffold_nav_bar.dart';
import 'package:go_router/go_router.dart';

import 'middleware.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class Navigation {
  static late BuildContext _context;

  static Navigation? _instance;

  static Navigation of(BuildContext context) {
    _context = context;
    _instance ??= Navigation();

    return _instance!;
  }

  go(RouteData route) {
    return _context.go(route.location);
  }

  back() {
    // check can i pop;
    return _context.pop();
  }

  push(RouteData route) {
    return _context.push(route.location);
  }

  pop() {
    return _context.pop();
  }

  canPop() {
    return _context.canPop();
  }

  replace(RouteData route) {
    _context.replace(route.location);
  }
}

abstract class RouteData {
  String get location;
}

class NewsDetailRoute extends RouteData {
  NewsDetailRoute({required this.id});

  final String id;

  @override
  String get location => '/news/$id';

  static route() => GoRoute(
        path: ':id',
        //redirect: authMiddleware,
        builder: (context, state) => NewsDetailScreen(
          id: state.pathParameters['id']!,
        ),
      );
}

class NewsRoute extends RouteData {
  @override
  String get location => '/news';

  static route() => GoRoute(
        path: '/news',
        builder: (context, state) => const NewsScreen(),
        routes: [
          NewsDetailRoute.route(),
        ],
      );
}

class AuthRoute extends RouteData {
  @override
  String get location => '/auth';

  static route() => GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      );
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    AuthRoute.route(),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            NewsRoute.route(),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/users',
              builder: (context, state) => const UsersScreen(),
            ),
          ],
        ),
      ],
    )
  ],
);
