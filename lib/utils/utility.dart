import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

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

/// 메뉴 함수
///
///  * [context], 컨텍스트
///  * [child], 메뉴에 표시 될 위젯
///  * [menuBoxDecoration], 메뉴 표현 장식
///  * [menuWidth], 메뉴 가로 길이
///  * [menuHeight], 메뉴 세로 길이
///  * [menuHeight], 메뉴 세로 길이
///  * [topPositioned], 상단 기준 여백
///  * [bottomPositioned], 하단 기준 여백
///  * [leftPositioned], 좌측 기준 여백
///  * [rightPositioned], 우측 기준 여백
///
Future<void> customShowMenu({
  required BuildContext context,
  required Widget child,
  BoxDecoration? menuBoxDecoration,
  double? menuWidth,
  double? menuHeight,
  double? topPositioned,
  double? bottomPositioned,
  double? leftPositioned,
  double? rightPositioned,
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
                  top: topPositioned,
                  bottom: bottomPositioned,
                  left: leftPositioned,
                  right: rightPositioned,
                  child: Container(
                    width: menuWidth,
                    height: menuHeight,
                    decoration: menuBoxDecoration ??
                        BoxDecoration(color: Colors.grey[200]),
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

/// 메시지 - 스낵바
///
///  * [context], 컨텍스트
///  * [message], 메시지 내용
///
void customShowSnackbar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

/// 메시지 - 다이얼록
///
///  * [context], 컨텍스트
///  * [barrierDismissible], 배경 클릭 시 팝업창 닫기 여부
///  * [title], 제목
///  * [content], 내용
///
Future<bool> customShowDialogOKCancel({
  required BuildContext context,
  bool barrierDismissible = true,
  String? title,
  String? content,
}) async {
  return await showDialog<bool>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) {
          return Platform.isAndroid
              ? AlertDialog(
                  title: Text(title ?? '제목'),
                  content: Text(content ?? '내용'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop(false);
                      },
                      child: const Text(
                        '취소',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop(true);
                      },
                      child: const Text(
                        '확인',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              : CupertinoAlertDialog(
                  title: Text(title ?? '제목'),
                  content: Text(content ?? '내용'),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        context.pop(false);
                      },
                      child: const Text(
                        '취소',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop(true);
                      },
                      child: const Text(
                        '확인',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                );
        },
      ) ??
      false;
}
