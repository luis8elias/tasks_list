import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/presentation/task/list/providers/task_list_provider.dart';
import '/presentation/task/delete/delete_task_dialog.dart';
import '/presentation/task/update/update_task_screen.dart';
import '/config/app_theme.dart';
import '/config/size_constants.dart';


class OptionsBottomSheet extends StatelessWidget {
  const OptionsBottomSheet({
    super.key,
    required this.taskId
  });

  final int taskId;

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
                onTap: (){
                  Navigator.of(context).pop();
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context2) {
                      return ListenableProvider.value(
                        value: context.read<TaskListProvider>(),
                        child: DeleteTaskDialog(taskId: taskId)
                      );
                    },
                  );
                },
                leading: const Icon(
                  Icons.delete,
                  color:  StatusColors.error,
                ),
                title: Text(
                  'Eliminar',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: StatusColors.error
                  )
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                   GoRouter.of(context).go(
                    context.namedLocation(
                      UpdateTaskScreen.routeName,
                      params: {'tid': taskId.toString()}
                    )
                  );
                },
                leading:  Icon(
                  Icons.edit,
                  color:  Theme.of(context).primaryColorDark,
                ),
                title: Text(
                  'Actulizar',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).primaryColorDark
                  )
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