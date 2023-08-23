import 'package:fittrix/providers/providers.dart';
import 'package:fittrix/screens/home_screen.dart';
import 'package:fittrix/screens/record_screen.dart';
import 'package:fittrix/screens/auth_screen.dart';
import 'package:fittrix/screens/detail_screen.dart';
import 'package:fittrix/screens/main_screen.dart';
import 'package:fittrix/screens/recording_screen.dart';
import 'package:fittrix/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');

class Routes {
  static const String home = '/home';

  static const String recording = '/recording';
  static const String record = '/record';
  static const String auth = '/auth';
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final router = RouterNotifier(ref);

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.recording,
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
    var authStatus = _ref.read(authProvider).status;

    if (authStatus == AuthState.unauthorized && state.fullPath != Routes.auth) {
      return Routes.home;
    }

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
              path: Routes.home,
              pageBuilder: (context, state) {
                return const CupertinoPage(child: HomeScreen());
              },
            ),
            GoRoute(
              path: Routes.recording,
              pageBuilder: (context, state) {
                return const CupertinoPage(child: RecordingScreen());
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  pageBuilder: (context, state) {
                    return const CupertinoPage(
                        child: DetailsScreen(label: 'C'));
                  },
                ),
              ],
            ),
            GoRoute(
              path: Routes.record,
              pageBuilder: (context, state) {
                return const CupertinoPage(child: RecordScreen());
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  pageBuilder: (context, state) {
                    return const CupertinoPage(
                        child: DetailsScreen(label: 'C'));
                  },
                ),
              ],
            ),
            GoRoute(
              path: Routes.auth,
              pageBuilder: (context, state) {
                return const CupertinoPage(child: AuthScreen());
              },
            ),
          ],
        ),
      ];
}
