import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';

import '/presentation/task/list/providers/delete_task_provider.dart';
import '/presentation/task/list/widgets/task_list_view.dart';
import '/presentation/task/list/widgets/tasks_tab_bar.dart';
import '/config/size_constants.dart';
import '/presentation/shared/loader_widget.dart';
import '/presentation/task/list/widgets/new_task_button.dart';
import '/presentation/task/list/providers/task_list_provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  static const String routeName = '/tasks';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (context) => TaskListProvider(
            taskRepository: Injector.appInstance.get()
          )..fetchTaskList(),
        ),

        ChangeNotifierProvider(
          create: (context) => DeleteTaskPrivider(
            taskListProvider: context.read<TaskListProvider>(),
            taskRepository: Injector.appInstance.get()
          ),
        )

      ],
      child: const TaskListScreenBuilder(),
    );
  }
}



class TaskListScreenBuilder extends StatelessWidget {
  const TaskListScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleSpacing: kPadding,
        title: FadeIn(
          child: Text(
            'Tareas',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: kPadding
            ),
            child: NewTaskButton(),
          )
        ],
      ),
      body: Consumer<TaskListProvider>(
        builder: (context, prov, child) {

          if(prov.status == TaskListStatus.loading){
            return const LoaderWidget();
          }

          if(prov.status == TaskListStatus.failed){
            return Center(child: Text(prov.message));
          }
          
          return const TaskListScreenUI();
        },
      )
    );
  }
}



class TaskListScreenUI extends StatelessWidget {
  const TaskListScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TasksTabBar(),
        Expanded(
          child: TasksListView()
        )
      ],
    );
  }
}