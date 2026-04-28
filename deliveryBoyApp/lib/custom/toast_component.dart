

import 'package:active_flutter_delivery_app/custom/custom_dependency/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:active_flutter_delivery_app/my_theme.dart';

class ToastComponent {
  static void showDialog(String msg, BuildContext context,
      {int duration = 3, ToastGravity gravity = ToastGravity.BOTTOM}) {
    Toast.show(
      msg,
      context,
      duration: duration,
      gravity: gravity,
      backgroundColor: const Color.fromRGBO(239, 239, 239, .9),
      textStyle: TextStyle(color: MyTheme.font_grey),
      border: const Border(
        top: BorderSide(color: Color.fromRGBO(203, 209, 209, 1)),
        bottom: BorderSide(color: Color.fromRGBO(203, 209, 209, 1)),
        left: BorderSide(color: Color.fromRGBO(203, 209, 209, 1)),
        right: BorderSide(color: Color.fromRGBO(203, 209, 209, 1)),
      ),
      backgroundRadius: 6.0,
    );
  }
}
