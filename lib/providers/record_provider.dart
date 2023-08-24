import 'dart:async';

import 'package:fittrix/repositories/record_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recordNotifierProvider = AsyncNotifierProvider<RecordNotifier, List<Record>>(RecordNotifier.new);

class RecordNotifier extends AsyncNotifier<List<Record>> {
  @override
  FutureOr<List<Record>> build() {
    return _fetchRecords();
  }

  Future<List<Record>> _fetchRecords() {
    return ref.read(recordRepositoryProvider).searchRecords();
  }

  Future<void> addRecord(Record record) async{
    state = const AsyncValue.loading();
    try {
      var result = await ref.read(recordRepositoryProvider).addRecord(record);
      state = AsyncValue.data([...state.value!,result]);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }

  void deleteRecord(Record deleteRecord) async{
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
