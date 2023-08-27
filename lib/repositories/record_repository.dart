import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fittrix/utils/enums.dart';

/// 운동 기록 Repository Provider
final recordRepositoryProvider =
    Provider((ref) => RecordRepository(), name: 'recordRepositoryProvider');

/// 운동 기록 Repository
class RecordRepository {
  /// 운동 기록 조회
  Future<List<Record>> searchRecords() async {
    print('운동 기록 조회');
    throw UnimplementedError();
  }

  /// 운동 기록 추가
  Future<Record> addRecord(Record record) async {
    print('운동 기록 추가');
    throw UnimplementedError();
  }

  /// 운동 기록 삭제
  Future<Record> deleteRecord(Record record) async {
    print('운동 기록 추가');
    throw UnimplementedError();
  }
}

/// 운동 기록 Repository Mock
class FakeRecordRepository implements RecordRepository {
  /// 운동 기록 조회
  @override
  Future<List<Record>> searchRecords() async {
    print('테스트 운동 기록 조회');
    return [
      Record(
          fitnessType: FitnessType.legRaise,
          createdAt: DateTime(2023, 8, 9, 18, 30),
          content: '오늘의 레그 레이즈 운동은 나에게 더 나은 체력과 근력을 향해 한 걸음 더 나아갈 수 있는 기회였다'),
      Record(
          fitnessType: FitnessType.lunge,
          createdAt: DateTime(2023, 8, 8, 18, 15),
          content:
              '오늘의 런지 운동은 성공적으로 마쳤고, 앞으로도 꾸준한 노력을 통해 목표한 근육 강화를 이루어나가고 싶다는 다짐을 하며 운동을 마무리했다.'),
      Record(
        fitnessType: FitnessType.squat,
        createdAt: DateTime(2023, 8, 7, 17, 56),
        content: ' 오늘의 스쿼트 운동은 나에게 더 큰 도전과 성취감을 주었다.',
      ),
      Record(
        fitnessType: FitnessType.pushUp,
        createdAt: DateTime(2023, 8, 6, 18, 50),
        content: '이번에는 10회를 목표로 했는데, 이전보다 더 힘들게 느껴졌다.',
      ),
    ];
  }

  /// 운동 기록 추가
  @override
  Future<Record> addRecord(Record record) async {
    print('테스트 운동 기록 추가');
    return record;
  }

  /// 운동 기록 삭제
  @override
  Future<Record> deleteRecord(Record record) async {
    print('테스트 운동 기록 삭제');
    return record;
  }
}

/// 운동 기록
class Record extends Equatable {
  /// 아이디
  late final String id;

  /// 운동 타입
  final FitnessType fitnessType;

  /// 작성일자
  final DateTime createdAt;

  /// 내용
  final String content;

  Record({
    required this.fitnessType,
    required this.createdAt,
    required this.content,
  }) {
    id = createdAt.toString();
  }

  @override
  List<Object> get props => [id, fitnessType, createdAt, content];
}
