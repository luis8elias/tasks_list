import 'package:flutter/material.dart';
import '/config/size_constants.dart';
class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.label
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        kPadding/2
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kPadding/2,
          horizontal: kPadding
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadiusDirectional.circular(100)
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).primaryColorLight
          ),
        ),
      ),
    );
  }
}