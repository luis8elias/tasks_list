import 'package:flutter/material.dart';
import 'package:task_list/config/size_constants.dart';
import '/config/app_theme.dart';

class Alerts{

  static  void showSuccess({
    required BuildContext context,
    required String message
  }){

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(
          kPadding * 2
        ),
        content: Row(
          children: [
            Icon(
              Icons.check,
              color: Theme.of(context).primaryColorLight,
            ),
            const SizedBox(width: kPadding),
            Text(message)
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
      )
    );
  }

  static void showFailed({
    required BuildContext context,
    required String message
  }){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(
          kPadding * 2
        ),
        content: Row(
          children: [
            Icon(
              Icons.error,
              color: Theme.of(context).primaryColorLight,
            ),
            Text(message)
          ],
        ),
        backgroundColor: StatusColors.error,
      )
    );

  }
}