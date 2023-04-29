import 'package:flutter/material.dart';

import '/config/size_constants.dart';


class OptionsBottomSheet extends StatelessWidget {
  const OptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration:   BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius:  const BorderRadius.only(
              topLeft:  Radius.circular(kBorderRadius),
              topRight: Radius.circular(kBorderRadius)
            )
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: kPadding,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor,
                  borderRadius: BorderRadius.circular(kBorderRadius)
                ),
                height: 5,
                width: 35,
              ),
              const SizedBox(
                height: kPadding * 2,
              ),
              ListTile(
                onTap: (){},
                leading: Icon(
                  Icons.delete,
                  color:  Theme.of(context).primaryColorDark,
                ),
                title: Text(
                  'Eliminar',
                  style: Theme.of(context).textTheme.labelMedium
                ),
              ),
              ListTile(
                onTap: () => Navigator.pop(context),
                leading: Icon(
                  Icons.close,
                  color: Theme.of(context).primaryColorDark,
                ),
                title: Text(
                  'Cerrar',
                  style: Theme.of(context).textTheme.labelMedium
                ),
              ),
              const SizedBox(
                height: kPadding * 2,
              ),
            ],
          ),
        )
      )
    );
  }
}