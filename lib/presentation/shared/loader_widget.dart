import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '/config/size_constants.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
   
    return FadeIn(
      child: Center(
        child: Padding(
          padding: const  EdgeInsets.symmetric(
            vertical: kPadding,
          ),
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}