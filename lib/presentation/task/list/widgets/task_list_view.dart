import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/presentation/task/list/widgets/task_tile.dart';
import '/presentation/task/list/providers/task_list_provider.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: Theme.of(context).colorScheme.onSecondary,
      child: ListView.builder( 
        itemCount: context.select<TaskListProvider,int>((p) => p.filteredTasks.length),
        itemBuilder: (context, index) {
          final tasks = context.read<TaskListProvider>().filteredTasks;
          return  TaskTile(
            task: tasks[index],
          );
        },
      ),
    );
  }
}


