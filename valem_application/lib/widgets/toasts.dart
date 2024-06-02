import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> alreadyUse() {
  return Fluttertoast.showToast(
      msg: 'Bu mail zaten kullanılıyor.',
      timeInSecForIosWeb: 3,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_LONG);
}

Future<bool?> weakPassword() {
  return Fluttertoast.showToast(
      msg: 'Zayıf Şifre',
      timeInSecForIosWeb: 3,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_LONG);
}

Future<bool?> mailError() {
  return Fluttertoast.showToast(
      msg: 'Bir hata oluştu, lütfen tekrar deneyin.',
      timeInSecForIosWeb: 3,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_LONG);
}
