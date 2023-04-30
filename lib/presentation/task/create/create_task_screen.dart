import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';

import '/common/alerts.dart';
import '/presentation/shared/loader_widget.dart';
import '/presentation/task/create/providers/create_task_proivder.dart';
import '/presentation/task/list/task_list_screen.dart';

import '/config/size_constants.dart';
import '/presentation/shared/task_from.dart';



class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  static const String routeName = 'create';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateTaskProivder(
        taskRepository: Injector.appInstance.get()
      ),
      child: const CreateTaskScreenListener(),
    );
  }
}


class CreateTaskScreenListener extends StatelessWidget {
  const CreateTaskScreenListener({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateTaskProivder>(
      builder: (context, prov, child) {

        if(prov.status  == CreateTaskStatus.success){

          WidgetsBinding.instance.addPostFrameCallback((_) {
            GoRouter.of(context).replace(TaskListScreen.routeName);
            Alerts.showSuccess(context: context, message: prov.message);
          });
          
        }
        
        if(prov.status  == CreateTaskStatus.failed){

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Alerts.showFailed(context: context, message: prov.message);
          });

        }
        return child!;
      },
      child: const CreateTaskScreenUI(),
    );
  }
}


class CreateTaskScreenUI extends StatelessWidget {
  const CreateTaskScreenUI({super.key});

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
            GoRouter.of(context).pop();
          },
        ),
        title: FadeIn(
          child: Text(
            'Crear tarea',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: TaskForm(
        buttonFactory: (button) {
          return Consumer<CreateTaskProivder>(
            builder: (context, value, child) {
              if(value.status == CreateTaskStatus.loading){
                return const LoaderWidget();
              }
              return button;
            },
          );
        },
        onSave: (title, isCompleted, dueDate, comments, description, tags) {
          context.read<CreateTaskProivder>().createTask(
            title: title,
            isCompleted: isCompleted,
            dueDate: dueDate,
            comments: comments,
            description: description,
            tags: tags
          );
        },
      ),
    );
  }
}