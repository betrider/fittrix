import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 팝업 메뉴 함수
Future<void> customShowMenu({
  required BuildContext context,
  required Widget child,
  BoxDecoration? menuBoxDecoration,
  double? menuWidth,
  double? menuHeight,
  double? topOffset,
  double? bottomOffset,
  double? leftOffset,
  double? rightOffset,
}) async {
  await Navigator.push(
    context,
    PageRouteBuilder(
      fullscreenDialog: true,
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        animation = Tween(begin: 0.0, end: 1.0).animate(animation);
        return FadeTransition(
          opacity: animation,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(color: Colors.transparent),
                ),
                Positioned(
                  top: topOffset,
                  bottom: bottomOffset,
                  left: leftOffset,
                  right: rightOffset,
                  child: Container(
                    width: menuWidth,
                    height: menuHeight,
                    decoration:
                        menuBoxDecoration ?? BoxDecoration(color: Colors.grey[200]),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

DateTime? _firstTouchTime; // 뒤로가기 버튼 첫번째 누른 시간
DateTime? _secondTouchTime; // 뒤로가기 버튼 두번째 누른 시간

/// 뒤로가기 종료 함수
Future<bool> onBackPressed() async {
  if (_firstTouchTime == null) {
    customShowToast(
      message: '뒤로 버튼을 한번 더 누르시면 종료됩니다.',
    );
    _firstTouchTime = DateTime.now();
  } else {
    _secondTouchTime = DateTime.now();
    if (_secondTouchTime!.difference(_firstTouchTime!).inSeconds <= 2) {
      SystemNavigator.pop();
    } else {
      customShowToast(
        message: '뒤로 버튼을 한번 더 누르시면 종료됩니다.',
      );
      _firstTouchTime = DateTime.now();
    }
  }
  return false;
}

/// 메시지 - 토스트
///
///  * [message], 메시지 내용
///  * [backgroundColor], 백그라운드 색상
///  * [textColor], 텍스트 색상
///  * [fontSize], 폰트 사이즈
///
Future<bool?> customShowToast({
  required String message,
  Color backgroundColor = Colors.black54,
  Color? textColor,
  double fontSize = 16,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: fontSize,
  );
}