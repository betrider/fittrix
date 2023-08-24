import 'package:fittrix/providers/record_provider.dart';
import 'package:fittrix/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 운동 기록 보기 화면
class RecordViewScreen extends ConsumerWidget {
  const RecordViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var result = ref.watch(recordNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('운동 기록 보기'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: result.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var record = data[index];
                  return Text(record.content);
                },
              );
            },
            error: (error, stackTrace) {
              return CustomErrorWidget(
                onPressed: () {
                  ref.invalidate(recordNotifierProvider);
                },
              );
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
