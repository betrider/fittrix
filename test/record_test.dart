import 'package:fittrix/providers/providers.dart';
import 'package:fittrix/repositories/repositories.dart';
import 'package:fittrix/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  late final ProviderContainer ref;

  setUpAll(() async {
    print('initState');
    ref = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWith((ref) => FakeAuthRepository()),
        recordRepositoryProvider.overrideWith((ref) => FakeRecordRepository()),
      ],
    );
  });

  group('1.auth', () {
    test('signIn', () async{
      String id = '12345';
      await ref.read(authNotifierProvider.notifier).signIn(id);
      var status = ref.read(authNotifierProvider).status;
      expect(status, AuthState.authorized);
    });
    test('signOut', () async{
      String id = '12345';
      await ref.read(authNotifierProvider.notifier).signIn(id);
      await ref.read(authNotifierProvider.notifier).signOut();
      var status = ref.read(authNotifierProvider).status;
      expect(status, AuthState.unauthorized);
    });
  });

  group('2.record', () {
    test('searchRecords', () async{
      var result = await ref.read(recordRepositoryProvider).searchRecords();
      print(result);
      expect(true, true);
    });
    test('addRecord', () async{
      var oldRecords = await ref.read(recordAsyncNotifierProvider.future);
      
      var record = Record(fitnessType: FitnessType.legRaise, createdAt: DateTime.now(), content: 'content6');
      ref.read(recordAsyncNotifierProvider.notifier).addRecord(record);

      var newRecords = await ref.read(recordAsyncNotifierProvider.future);

      expect(oldRecords.length , newRecords.length - 1);
    });

    test('deleteRecord', () async{
      var oldRecords = await ref.read(recordAsyncNotifierProvider.future);
      
      var record = oldRecords[2];
      ref.read(recordAsyncNotifierProvider.notifier).deleteRecord(record);

      var newRecords = await ref.read(recordAsyncNotifierProvider.future);

      expect(oldRecords.length - 1 , newRecords.length);
    });
  });

  tearDownAll(() {
    print('dispose');
  });
}
