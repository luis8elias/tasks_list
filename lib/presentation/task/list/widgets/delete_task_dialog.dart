import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/common/alerts.dart';

import '/config/app_theme.dart';
import '/config/size_constants.dart';
import '/presentation/shared/loader_widget.dart';
import '/presentation/task/list/providers/delete_task_provider.dart';


class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({
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
                    height: 70,
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
                    height: 70,
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