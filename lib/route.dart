import 'package:fittrix/providers/providers.dart';
import 'package:fittrix/screens/a_screen.dart';
import 'package:fittrix/screens/b_screen.dart';
import 'package:fittrix/screens/c_screen.dart';
import 'package:fittrix/screens/detail_screen.dart';
import 'package:fittrix/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey(debugLabel: 'shell');

class Routes {
  static const String a = '/a';
  static const String b = '/b';
  static const String c = '/c';
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final router = RouterNotifier(ref);

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.a,
      refreshListenable: router,
      debugLogDiagnostics: true,
      routes: router._routes,
      redirect: router._redirect,
    );
  },
);

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  late final ProviderSubscription? _subscription;

  RouterNotifier(this._ref) {
    _subscription = _ref.listen<AuthStates>(
      authProvider,
      (_, __) => notifyListeners(),
    );

    _ref.onDispose(() {
      _subscription?.close();
    });
  }

  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    return null;
  }

  List<RouteBase> get _routes => <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return MainScreen(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) {
                return const CupertinoPage(child: ScreenA());
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  pageBuilder: (context, state) {
                    return const CupertinoPage(child: DetailsScreen(label: 'C'));
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) {
                return const CupertinoPage(child: ScreenB());
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) {
                    return const CupertinoPage(child: DetailsScreen(label: 'C'));
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/c',
              pageBuilder: (context, state) {
                return const CupertinoPage(child: ScreenC());
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  pageBuilder: (context, state) {
                    return const CupertinoPage(child: DetailsScreen(label: 'C'));
                  },
                ),
              ],
            ),
          ],
        ),
      ];
}
