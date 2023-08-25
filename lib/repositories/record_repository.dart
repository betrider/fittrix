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
    print('운동기록 조회');
    throw UnimplementedError();
  }

  /// 운동 기록 추가
  Future<Record> addRecord(Record record) async {
    print('운동기록 추가');
    throw UnimplementedError();
  }

  /// 운동 기록 삭제
  Future<Record> deleteRecord(Record record) async {
    print('운동기록 추가');
    throw UnimplementedError();
  }
}

/// 운동 기록 Repository Mock
class FakeRecordRepository implements RecordRepository {
  /// 운동 기록 조회
  @override
  Future<List<Record>> searchRecords() async {
    print('테스트 운동기록 조회');
    return [
      Record(
        fitnessType: FitnessType.legRaise,
        createdAt: DateTime(2023, 8, 9, 18, 30),
        content: '''
오늘은 레그 레이즈 운동을 했다. 다리 근육을 강화하고 코어 근육을 힘있게 만들기 위해 이 운동을 선택했다. 지난 주부터 꾸준한 운동 습관을 만들기 위해 노력하고 있는데, 체력과 근력이 서서히 늘어나고 있다는 느낌이 들어 기분이 좋다.

운동을 시작하기 전에는 항상 워밍업을 신경쓴다. 오늘도 러닝 머신으로 10분간의 유산소 워밍업으로 몸을 준비했다. 근육을 풀어주기 위해 스트레칭과 동적인 동작들로 준비를 마무리했다.

레그 레이즈 운동을 시작했다. 바닥에 누워서 손을 옆으로 대고 다리를 높이 들어 올리는 동작이다. 처음에는 15회를 목표로 시작했다. 다리를 들 때마다 하체 근육을 느낄 수 있었다. 어깨와 머리를 바닥에서 들어 올려 코어 근육을 더욱 더 차단하면서 운동을 수행했다.

첫 번째 세트를 마친 후에는 조금 휴식을 취하고, 두 번째 세트에 돌입했다. 이번에도 15회를 목표로 하고 있었는데, 이전보다 조금 힘들게 느껴졌다. 그럼에도 불구하고 꾸준한 호흡과 집중을 통해 성공적으로 운동을 수행했다.

운동을 마치고 나서는 다시 스트레칭을 통해 근육을 이완시켰다. 오늘의 레그 레이즈 운동은 나에게 더 나은 체력과 근력을 향해 한 걸음 더 나아갈 수 있는 기회였다. 매번 노력하고 기록을 남기며 나만의 목표를 향해 나아가고 있다는 느낌이 참 좋다. 앞으로도 꾸준한 노력으로 더 나은 나를 만들어갈 것이다.
'''),
      Record(
          fitnessType: FitnessType.lunge,
          createdAt: DateTime(2023, 8, 8, 18, 15),
          content: '''
오늘은 런지 운동을 했다. 이번 주부터 꾸준히 운동을 시작한 터라 근육 통증이 조금 있는 편이지만, 목표를 이루기 위해 계속해서 노력하고 있다.

운동 시작 전에는 꼭 워밍업을 하는 습관을 가지고 있다. 오늘도 러닝 머신으로 10분간 유산소 워밍업을 했다. 그 후에는 근력 운동을 위한 준비 동작들을 했다. 스트레칭과 근육을 조금 풀어주는 동작들은 운동 수행에 도움이 많이 된다.

전방 런지 운동을 시작했다. 한쪽 다리를 앞으로 내밀고 굽혀서 다른 다리의 무릎을 바닥에 가까이 내려놓는 동작이다. 처음에는 가볍게 시작해서 10회를 수행했다. 그 후에는 휴식을 취하고 다시 10회를 추가로 수행했다. 무릎이 바닥에 닿을 때마다 근육을 느낄 수 있었다. 각 세트 사이에는 1분 정도의 휴식을 취했다.

이번에는 추가로 무게를 들어서 런지를 해보기로 했다. 5kg의 덤벨을 손에 들고 운동을 시작했다. 중량을 들면서 처음보다 조금 더 힘들지만, 꾸준한 노력을 통해 근육을 강화하고자 하는 목표를 가지고 있어서 계속해서 수행했다. 중량을 들고 8회를 수행한 후, 다시 휴식을 취하고 8회를 추가로 수행했다.

운동을 마친 후에는 근육 스트레칭을 통해 근육을 풀어주고 몸을 이완시켰다. 오늘의 런지 운동은 성공적으로 마쳤고, 앞으로도 꾸준한 노력을 통해 목표한 근육 강화를 이루어나가고 싶다는 다짐을 하며 운동을 마무리했다.
'''),
      Record(
          fitnessType: FitnessType.squat,
          createdAt: DateTime(2023, 8, 7, 17, 56),
          content: '''
오늘은 스쿼트 운동을 했다. 다리 근육과 힘을 키우는 데 도움이 되는 이 운동을 선택했다. 이전부터 꾸준한 운동 습관을 만들기 위해 노력하고 있는데, 몸의 변화와 함께 자신감도 조금씩 찾아가는 느낌이라 기분이 좋다.

운동 시작 전에는 워밍업을 소홀히 하지 않기 위해 항상 신경을 쓴다. 오늘도 러닝 머신으로 10분간의 유산소 워밍업을 했다. 몸을 풀어주기 위해 다양한 스트레칭과 관절 동작을 추가로 했다.

스쿼트 운동을 시작했다. 어깨 너비로 발을 벌리고, 무게 중심을 가운데에 두고 무릎을 굽혀 내리는 동작이다. 오늘은 덤벨을 이용해서 스쿼트를 해보기로 했다. 10kg의 덤벨을 양손에 들고 15회를 목표로 시작했다. 처음 몇 번은 비교적 수월하게 할 수 있었지만, 점점 무게가 느껴지면서 조금 힘들어졌다. 그럼에도 불구하고 꾸준한 호흡과 근육을 집중해서 운동을 수행했다.

첫 번째 세트를 마친 후에는 조금 휴식을 취하고, 두 번째 세트로 돌입했다. 무게를 들고 스쿼트를 하니 이전보다 더욱 도전적이었다. 하지만 나의 목표를 생각하며 꾸준히 동작을 수행했다.

운동을 마치고 몸을 이완시키기 위해 스트레칭을 했다. 오늘의 스쿼트 운동은 나에게 더 큰 도전과 성취감을 주었다. 매번 조금씩 나아가고 목표를 향해 노력하는 것이 보람을 주는 순간이다. 앞으로도 꾸준한 노력과 기록을 통해 나 자신을 더 발전시키고 싶다는 각오로 운동을 마무리했다.
'''),
      Record(
          fitnessType: FitnessType.pushUp,
          createdAt: DateTime(2023, 8, 6, 18, 50),
          content:'''
오늘은 푸쉬업 운동을 했다. 상체 근육을 강화하고 코어 근육을 힘있게 만들기 위해 이 운동을 선택했다. 운동을 통해 몸의 변화를 느끼면서 자신감을 키워가고 있는 느낌이라 뿌듯하다.

운동 시작 전에는 항상 워밍업을 철저하게 하는 습관이 있다. 오늘도 러닝 머신으로 10분간의 유산소 워밍업을 했다. 팔과 어깨 근육을 준비하기 위해 동적인 스트레칭을 추가로 했다.

푸쉬업을 시작했다. 팔을 어깨 너비로 벌리고 손바닥을 바닥에 대고 몸을 내리고 올리는 동작이다. 처음에는 10회를 목표로 시작했다. 첫 번째 몇 번은 비교적 쉽게 할 수 있었지만, 그 후로 팔과 가슴 근육에 힘이 들어가며 어려웠다. 그럼에도 불구하고 계속해서 집중해서 운동을 수행했다.

첫 번째 세트를 마친 후에는 조금 휴식을 취하고, 두 번째 세트로 돌입했다. 이번에도 10회를 목표로 했는데, 이전보다 더 힘들게 느껴졌다. 그래도 나의 목표를 생각하며 꾸준한 호흡과 근육을 느끼며 운동을 이어갔다.

운동을 마치고 팔과 어깨 근육을 스트레칭으로 이완시켰다. 오늘의 푸쉬업 운동은 나에게 더 큰 도전을 주었다. 어려움을 극복하고 몸을 더 강하게 만들어가는 느낌이 정말 좋다. 앞으로도 꾸준한 노력과 기록을 통해 더 나은 모습을 만들어가고 싶다는 다짐을 하며 운동을 마무리했다.
'''),
    ];
  }

  /// 운동 기록 추가
  @override
  Future<Record> addRecord(Record record) async {
    print('테스트 운동기록 추가');
    return record;
  }

  /// 운동 기록 삭제
  @override
  Future<Record> deleteRecord(Record record) async {
    print('테스트 운동기록 삭제');
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
