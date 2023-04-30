import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '/config/app_theme.dart';

class Alerts{

  static  void showSuccess({
    required BuildContext context,
    required String message
  }){
    Flushbar(
      message : message,
      icon: Icon(
        Icons.check,
        color: Theme.of(context).primaryColorLight,
      ),
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: Theme.of(context).primaryColor,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const  Duration(seconds: 3),
    ).show(context);

  }

  static void showFailed({
    required BuildContext context,
    required String message
  }){
    Flushbar(
      message : message,
      icon: Icon(
        Icons.error,
        color: Theme.of(context).primaryColorLight,
      ),
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: StatusColors.error,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const  Duration(seconds: 3),
    ).show(context);

  }
}