import 'package:fittrix/repositories/repositories.dart';
import 'package:fittrix/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

void main() {
  // 위젯 바인딩
  WidgetsFlutterBinding.ensureInitialized();

  // 가로모드 제어
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 다국어 기본 한국어로 적용
  Intl.defaultLocale = 'ko_KR';

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
      localizationsDelegates: const [
          //다국어 지원
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      supportedLocales: const [
        //다국어 지원
        Locale('ko', 'KR'),
        Locale('en', 'US'),
      ],
      routerConfig: router,
    );
  }
}
