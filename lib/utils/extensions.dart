import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


extension ToastExt<T> on T {
  void get toast {
    Fluttertoast.showToast(
      msg: toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 18,
    );
  }

  T get log {
    dev.log(toString());
    return this;
  }
}