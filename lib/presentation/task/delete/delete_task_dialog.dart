import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';
import '/presentation/task/delete/widgets/delete_task_dialog_button.dart';
import '/presentation/task/list/providers/task_list_provider.dart';

import '/common/alerts.dart';
import '/config/app_theme.dart';
import '/config/size_constants.dart';
import '/presentation/shared/loader_widget.dart';
import 'providers/delete_task_provider.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({
    super.key,
    required this.taskId
  });


  final int taskId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeleteTaskPrivider(
        taskListProvider: context.read<TaskListProvider>(),
        taskRepository: Injector.appInstance.get()
      )..resetStatus(),
      child: DeleteTaskDialogUI(taskId: taskId),
    );
  }
}


class DeleteTaskDialogUI extends StatelessWidget {
  const DeleteTaskDialogUI({
    super.key,
    required this.taskId
  });

  final int taskId;

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteTaskPrivider>(
      builder: (context, prov, child) {

        if(prov.status  == DeleteTaskStatus.success){

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Alerts.showSuccess(context: context, message: prov.message);
          });
          Navigator.of(context).pop();
          return const SizedBox.shrink();
        }
        
        if(prov.status  == DeleteTaskStatus.failed){

          WidgetsBinding.instance.addPostFrameCallback((_) {
           Alerts.showFailed(context: context, message: prov.message);
          });
          Navigator.of(context).pop();
          return const SizedBox.shrink();

        }

        return AlertDialog(
          elevation: 1,
          insetPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.symmetric(
            vertical: kPadding / 1.5, 
            horizontal: kPadding / 1.5
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  SizedBox(
                    height: 65,
                    child: Consumer<DeleteTaskPrivider>(
                      builder: (context, prov, child) {
                        if (prov.status  == DeleteTaskStatus.loading) {
                          return const LoaderWidget();
                        }
                        return DeleteTaskDialogButton(
                          onPressed: () {
                            context.read<DeleteTaskPrivider>().deleteTask(taskId);
                          },
                          child: Text(
                            'Eliminar',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: StatusColors.error
                            )
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).hintColor,
                  ),
                  SizedBox(
                    height: 65,
                    child: DeleteTaskDialogButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:  Text(
                        'Cancelar',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).hintColor
                        )
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

