import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class CommonUtils {
  static Future showToast(BuildContext context, String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
    );
  }
}
