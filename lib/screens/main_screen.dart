import 'package:fittrix/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.home)) {
      return 0;
    }
    if (location.startsWith(Routes.record)) {
      return 1;
    }
    if (location.startsWith(Routes.auth)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(Routes.home);
        break;
      case 1:
        GoRouter.of(context).go(Routes.record);
        break;
      case 2:
        GoRouter.of(context).go(Routes.auth);
        break;
    }
  }
}
