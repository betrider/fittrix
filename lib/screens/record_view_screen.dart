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
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var record = data[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(record.createdAt.toFullDateTimeString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                        const SizedBox(height: 8),
                        Text('운동 종목 : ${record.fitnessType.toString()}', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text(record.content),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
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
