import 'package:fittrix/providers/record_provider.dart';
import 'package:fittrix/repositories/record_repository.dart';
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
                  return RecordItem(record: record);
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

class RecordItem extends ConsumerWidget {
  const RecordItem({
    super.key,
    required this.record,
  });

  final Record record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  record.createdAt.toFullDateTimeString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var isDone = await customShowDialogOKCancel(
                      context: context,
                      title: '삭제',
                      content: '운동 기록을 삭제하겠습니까?',
                    );

                    if (isDone) {
                      ref
                          .read(recordNotifierProvider.notifier)
                          .deleteRecord(record)
                          .then((value) {
                        customShowSnackbar(
                          context: context,
                          message: '운동 기록을 삭제했습니다.',
                        );
                      });
                    }
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '운동 종목 : ${record.fitnessType.toString()}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(record.content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
