import 'package:flutter/material.dart';
import '/config/size_constants.dart';


class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed
  });

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        enableFeedback: true,
        overlayColor: MaterialStatePropertyAll(
          Theme.of(context).primaryColor.withOpacity(0.2)
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)
          )
        ),
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).primaryColor.withOpacity(0.1)
        )
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Theme.of(context).primaryColor
      ), 
      label: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}