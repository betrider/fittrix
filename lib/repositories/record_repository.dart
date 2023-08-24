import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 운동기록 Repository Provider
final recordRepositoryProvider = Provider(
  (ref) => RecordRepository(),
  name: 'recordRepositoryProvider'
);

/// 운동기록 Repository
class RecordRepository {

  /// 운동기록 추가
  Future<Record> addRecord(Record record) async {
    throw UnimplementedError();
  }

  /// 운동기록 삭제
  Future<Record> deleteRecord(Record record) async {
    throw UnimplementedError();
  }

  /// 운동기록 조회
  Future<List<Record>> searchRecords() async {
    throw UnimplementedError();
  }
}

/// 운동기록 Repository Mock
class FakeRecordRepository implements RecordRepository {

  /// 운동기록 추가
  @override
  Future<Record> addRecord(Record record) async {
    print('운동기록 추가');
    return record;
  }

  /// 운동기록 삭제
  @override
  Future<Record> deleteRecord(Record record) async {
    print('운동기록 삭제');
    return record;
  }

  /// 운동기록 조회
  @override
  Future<List<Record>> searchRecords() async {
    print('운동기록 조회');
    return [
      Record(title: 'title1', content: 'content1'),
      Record(title: 'title2', content: 'content2'),
      Record(title: 'title3', content: 'content3'),
      Record(title: 'title4', content: 'content4'),
      Record(title: 'title5', content: 'content5'),
    ];
  }
}

/// 운동 기록
class Record {
  /// 제목
  final String title;
  /// 내용
  final String content;

  Record({
    required this.title,
    required this.content,
  });
}
