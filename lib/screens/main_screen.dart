import 'package:fittrix/providers/auth_provider.dart';
import 'package:fittrix/route.dart';
import 'package:fittrix/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 메인 화면
class MainScreen extends ConsumerWidget {
  const MainScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.create),
              label: '운동 기록 하기',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: '운동 기록 보기',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '로그인',
            ),
          ],
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context, ref),
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.home)) {
      return 0;
    }
    if (location.startsWith(Routes.recordView)) {
      return 1;
    }
    if (location.startsWith(Routes.auth)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context, WidgetRef ref) async {
    switch (index) {
      case 0:
        final authStatus = ref.read(authProvider).status;
        if (authStatus == AuthState.authorized) {
          await customShowMenu(
            context: context,
            menuWidth: 150,
            bottomOffset: kBottomNavigationBarHeight + 16,
            leftOffset: 16,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(FitnessType.lunge.toString()),
                    onTap: () {
                      context.pop();
                      context.pushRelative(Routes.record, pathParameters: {'type': FitnessType.lunge.name});
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: Text(FitnessType.squat.toString()),
                    onTap: () {
                      context.pop();
                      context.pushRelative(Routes.record, pathParameters: {'type': FitnessType.squat.name});
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: Text(FitnessType.pushUp.toString()),
                    onTap: () {
                      context.pop();
                      context.pushRelative(Routes.record, pathParameters: {'type': FitnessType.pushUp.name});
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: Text(FitnessType.legRaise.toString()),
                    onTap: () {
                      context.pop();
                      context.pushRelative(Routes.record, pathParameters: {'type': FitnessType.legRaise.name});
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          GoRouter.of(context).go(Routes.home);
        }
        break;
      case 1:
        GoRouter.of(context).go(Routes.recordView);
        break;
      case 2:
        GoRouter.of(context).go(Routes.auth);
        break;
    }
  }
}
