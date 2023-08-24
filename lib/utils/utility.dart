import 'package:flutter/material.dart';

Future<void> tsShowMenu({
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
