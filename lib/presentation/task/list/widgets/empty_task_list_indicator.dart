import 'package:flutter/material.dart';
import 'package:task_list/config/size_constants.dart';
import 'package:task_list/presentation/task/list/providers/task_list_provider.dart';

class EmptyTaskListIndicator extends StatelessWidget {
  const EmptyTaskListIndicator({
    super.key,
    required this.taskFilter
  });

  final TaskFilter taskFilter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.task_outlined,
            color: Theme.of(context).primaryColor,
            size: 70,
          ),
          const SizedBox(height: kPadding),
          Text(
            'Sin ${taskFilter.textValue}',
              style:Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 23,
            ),
          ),
           Text(
            'No hay tareas por mostrar',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).hintColor
            ),
          ),
          const SizedBox(height: 150,)
        ],
      ),
    );
  }
}