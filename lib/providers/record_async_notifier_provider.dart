import 'dart:async';

import 'package:fittrix/repositories/record_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 운동 기록 프로바이더
final recordAsyncNotifierProvider = AsyncNotifierProvider<RecordNotifier, List<Record>>(RecordNotifier.new);

class RecordNotifier extends AsyncNotifier<List<Record>> {
  @override
  FutureOr<List<Record>> build() {
    return _fetchRecords();
  }

  /// 운동 기록 조회
  Future<List<Record>> _fetchRecords() {
    return ref.read(recordRepositoryProvider).searchRecords();
  }

  /// 운동 기록 추가
  Future<void> addRecord(Record record) async{
    state = const AsyncValue.loading();
    try {
      var result = await ref.read(recordRepositoryProvider).addRecord(record);
      state = AsyncValue.data([result, ...state.value!]);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }

  /// 운동 기록 삭제
  Future<void> deleteRecord(Record deleteRecord) async{
    state = const AsyncValue.loading();
    try {
      var result = await ref.read(recordRepositoryProvider).deleteRecord(deleteRecord);
      state = AsyncValue.data([
        for (final todo in state.value!)
          if (todo.id != result.id) todo,
      ]);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
