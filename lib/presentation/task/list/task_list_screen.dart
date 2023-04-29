import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';

import '/presentation/task/list/providers/task_list_provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  static const String routeName = '/tasks';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskListProvider(
        taskRepository: Injector.appInstance.get()
      )..fetchTaskList(),
      child: const TaskListScreenBuilder(),
    );
  }
}


class TaskListScreenBuilder extends StatelessWidget {
  const TaskListScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Consumer<TaskListProvider>(
        builder: (context, prov, child) {

          if(prov.status == ActionStatus.loading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(prov.status == ActionStatus.failed){
            return Center(child:  Text(prov.message));
          }
          
          return const Placeholder();
        },
      )
    );
  }
}