import 'package:fittrix/utils/enums.dart';
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
      Record(fitnessType: FitnessType.legRaise, createdAt: DateTime(2023, 4, 7, 12, 30), content: 'content1 content1 content1 content1 content1 content1 content1 content1 content1 content1 content1 content1 content1 content1 content1'),
      Record(fitnessType: FitnessType.lunge, createdAt: DateTime(2023, 5, 7, 8, 30), content: 'content2 content2 content2 content2 content2 content2 content2 content2 content2 content2'),
      Record(fitnessType: FitnessType.squat, createdAt: DateTime(2023, 6, 7, 13, 30), content: 'content3 content3 content3 content3'),
      Record(fitnessType: FitnessType.pushUp, createdAt: DateTime(2023, 7, 7, 7, 30), content: 'content4 content4 content4 content4 content4 content4 content4 content4 content4 content4 content4 content4'),
      Record(fitnessType: FitnessType.legRaise, createdAt: DateTime(2023, 8, 7, 20, 30), content: 'content5'),
    ];
  }
}

/// 운동 기록
class Record {
  /// 아이디
  late final String id;
  /// 타입
  final FitnessType fitnessType;
  /// 제목
  final DateTime createdAt;
  /// 내용
  final String content;

  Record({
    required this.fitnessType,
    required this.createdAt,
    required this.content,
  }){
    id = createdAt.toString();
  }
}
