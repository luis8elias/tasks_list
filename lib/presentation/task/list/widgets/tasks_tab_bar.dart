import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/config/size_constants.dart';
import '/presentation/task/list/providers/task_list_provider.dart';

class TasksTabBar extends StatelessWidget {
  const TasksTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.symmetric(
          vertical: kPadding * 2
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TaskTabBarItem(
              selected: context.select<TaskListProvider,TaskFilter>(
                (p) => p.taskFilter 
              ) ==  TaskFilter.all,
              label: 'Todas',
              count: context.select<TaskListProvider,int>((p) => p.tasks.length),
              taskFilterValue: TaskFilter.all,
            ),
            const TaskTabBarItemDivider(),
            TaskTabBarItem(
              selected: context.select<TaskListProvider,TaskFilter>(
                (p) => p.taskFilter 
              ) ==  TaskFilter.completed,
              label: 'Completadas',
              count: context.select<TaskListProvider,int>((p) => p.completedTaskCount),
              taskFilterValue: TaskFilter.completed,
            ),
            const TaskTabBarItemDivider(),
            TaskTabBarItem(
              selected: context.select<TaskListProvider,TaskFilter>(
                (p) => p.taskFilter 
              ) ==  TaskFilter.notCompleted,
              taskFilterValue: TaskFilter.notCompleted,
              label: 'Sin Completar',
              count: context.select<TaskListProvider,int>((p) => p.notCompletedTaskCount),
            ),
          ],
        ),
      ),
    );
  }
}


class TaskTabBarItem extends StatelessWidget {
  const TaskTabBarItem({
    super.key,
    required this.selected,
    required this.count,
    required this.label,
    required this.taskFilterValue
  });

  final bool selected;
  final String label;
  final int count;
  final TaskFilter taskFilterValue;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        enableFeedback: true,
        overlayColor: MaterialStatePropertyAll(
          Theme.of(context).hintColor.withOpacity(0.1)
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)
          )
        ),
      ),
      onPressed: (){
        Provider.of<TaskListProvider>(context,listen: false).changeTaskFilter(
          taskFilterValue
        );
      },
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: selected 
              ? Theme.of(context).primaryColor 
              : Theme.of(context).hintColor 
            )
          ),
          const SizedBox(
            width: 5,
          ),
          Badge.count(
            largeSize: 25,
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 5
            ),
            count: count,
            backgroundColor: selected 
            ? Theme.of(context).primaryColor 
            : Theme.of(context).hintColor 
          )
        ],
      )
    );
  }
}

class TaskTabBarItemDivider extends StatelessWidget {
  const TaskTabBarItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kPadding/4
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(kBorderRadius)
      ),
      width: 2,
      height: 20,
    );
  }
}