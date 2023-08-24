import 'package:fittrix/repositories/repositories.dart';
import 'package:fittrix/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWith((ref) => FakeAuthRepository()),
        recordRepositoryProvider.overrideWith((ref) => FakeRecordRepository()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'fittrix project',
      theme: ThemeData(useMaterial3: true),
      routerConfig: router,
    );
  }
}
