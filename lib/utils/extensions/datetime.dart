import 'package:intl/intl.dart';

/// 기준 : 2021년 4월 17일 오후 3시 55분 20초
/// value.toFormatString('y') // '2021년'
/// value.toFormatString('yMMMM') // '2021년 4월'
/// value.toFormatString('yMMMMd') // '2021년 4월 17일'
/// value.toFormatString('yMMMMEEEEd') // '2021년 4월 17일 토요일'
/// value.toFormatString('yMMMMEEEEd a hh:mm') // '2021년 4월 17일 토요일 오후 3:55
/// value.toFormatString('yMMMMEEEd a hh:mm') // '2021년 4월 17일 토 오후 3:55
/// value.toFormatString('yMMMMEEEEd HH:mm') // '2021년 4월 17일 토요일 15:55'
///
/// value.toFormatString('yyyy-MM-DD') // '2021-04-17'
/// value.toFormatString('yyyy-MM') // '2021-04'
/// value.toFormatString('yyyy') // '2021'
/// value.toFormatString('HH:mm:ss') // '15:55:20'
/// value.toFormatString('HH:mm') // '15:55'
/// value.toFormatString('HH') // '15'
extension CustomDateTime on DateTime {

  /// 오후 11:39 (result:11)
  String toHour() {
    return DateFormat('hh').format(toLocal());
  }

  /// 오후 11:39 (result:39)
  String toMinute() {
    return DateFormat('mm').format(toLocal());
  }

  /// 오후 11:39 (result:23:39)
  String toHourMinute() {
    return DateFormat('HH:mm').format(toLocal());
  }

  /// 날짜 포맷
  ///
  /// Example:
  /// ```dart
  /// datetimeA.toFullDateTimeString(); // 2021년 4월 26일 월요일 오전 11:39:12
  /// ```
  String toFullDateTimeString() {
    return DateFormat('yMMMMEEEEd').add_jm().format(toLocal());
  }

}
