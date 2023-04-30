import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:task_list/presentation/task/see/see_task_screen.dart';
import '/presentation/task/list/providers/task_list_provider.dart';

import '/presentation/task/list/widgets/options_bottom_sheet.dart';
import '/presentation/shared/custom_checkbox.dart';
import '/config/size_constants.dart';
import '/domain/entities/task_entity.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task
  });
  
  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: kPadding,
        left: kPadding,
        right: kPadding
      ),
      child: ListTile(
        onTap: () {
          GoRouter.of(context).go(
            context.namedLocation(
              SeeTaskScreen.routeName,
              params: {'tid': task.id.toString()}
            )
          );
        },
        contentPadding: const EdgeInsets.all(kPadding),
        tileColor: Theme.of(context).primaryColorLight,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    decoration: task.isCompletedAsBool ? TextDecoration.lineThrough : null
                  ),
                ),
                CustomCheckBox(
                  isCheked: task.isCompletedAsBool,
                  readonly: true,
                )
              ],
            ),
            Divider(
              color: Theme.of(context).hintColor.withOpacity(0.4),
            ),
            Text(
              task.dueDate ?? 'Fecha no disponible',
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)
        ),
        enableFeedback: true,
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            isDismissible: false,
            enableDrag: true,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius + 5),
            ),
            builder:(context2) {
              return ChangeNotifierProvider.value(
                value: context.read<TaskListProvider>(),
                child: OptionsBottomSheet(
                  taskId: task.id,
                ),
              );
            },
          );
        },
      ),
    );
  }
}