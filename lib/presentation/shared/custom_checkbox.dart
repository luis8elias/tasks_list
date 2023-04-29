import 'package:flutter/material.dart';

import '/config/size_constants.dart';


class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isCheked
  });

  final bool isCheked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kBorderRadius),
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: CircleAvatar(
          radius: 12,
          backgroundColor: isCheked
          ? Theme.of(context).primaryColor
          : Theme.of(context).hintColor,
          child: isCheked 
          ? Icon(
            Icons.check,
            size: 15,
            color: Theme.of(context).primaryColorLight,
          )
          : const SizedBox.shrink(),
        ),
      ),
    );
  }
}