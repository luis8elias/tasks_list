import 'package:flutter/material.dart';
import '/config/size_constants.dart';


class DeleteTaskDialogButton extends StatelessWidget {
  const DeleteTaskDialogButton({
    super.key,
    required this.child, 
    required this.onPressed
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        enableFeedback: true,
        overlayColor: MaterialStatePropertyAll(
          Theme.of(context).highlightColor
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)
          )
        ),
      ),
      onPressed: onPressed,
      child: child
    );
  }
}