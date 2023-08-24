import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 운동 기록 보기 화면
class RecordViewScreen extends StatelessWidget {
  const RecordViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('운동 기록 보기'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('운동기록보기'),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/b/details');
                  },
                  child: const Text('View B details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}