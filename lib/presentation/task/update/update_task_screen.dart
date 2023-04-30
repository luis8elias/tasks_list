import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';
import '/presentation/task/update/providers/update_task_provider.dart';

import '/domain/entities/task_detailed_entity.dart';
import '/presentation/shared/providers/fetch_task_by_id_provider.dart';
import '/presentation/shared/loader_widget.dart';
import '/presentation/task/create/providers/create_task_proivder.dart';
import '/presentation/task/list/task_list_screen.dart';

import '/config/size_constants.dart';
import '/presentation/shared/task_from.dart';



class UpdateTaskScreen extends StatelessWidget {
  const UpdateTaskScreen({
    super.key,
    required this.taskId
  });

  static const String routeName = 'update/:tid';

  final int taskId;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (context) => FetchTaskByIdProvider(
            taskRepository: Injector.appInstance.get()
          )..fetchTaskDetailed(taskId: taskId)
        ),

        ChangeNotifierProvider(
          create: (context) => UpdateTaskProvider(
            
          )
        )

      ],
      child:  const UpdateTaskScreenBuilder(),
    );
    
  }
}


class UpdateTaskScreenBuilder extends StatelessWidget {
  const UpdateTaskScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleSpacing: kPadding,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go(TaskListScreen.routeName);
          },
        ),
        title: FadeIn(
          child: Text(
            'Editar tarea',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: Consumer<FetchTaskByIdProvider>(
        builder: (context, prov, child) {

          if(prov.status  == TaskDetailsStatus.loading){
            return const LoaderWidget();
          }

          if(prov.status == TaskDetailsStatus.failed){
            return Center(child: Text(prov.message));
          }
          
          return UpdateTaskScreenUI(
            taskDetailed: prov.taskDetailed!
          );
        },
      )
    );
  }
}


class UpdateTaskScreenUI extends StatelessWidget {
  const UpdateTaskScreenUI({
    super.key,
    required this.taskDetailed
  });

  final TaskDetailedEntity taskDetailed;

  @override
  Widget build(BuildContext context) {
    return TaskForm(
      task: taskDetailed,
      buttonFactory: (button) {
        return Consumer<UpdateTaskProvider>(
          builder: (context, value, child) {
            return button;
          },
        );
      },
      onSave: (title, isCompleted, dueDate, comments, description, tags) {
        
      },
    );
  }
}