import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';
import 'package:task_list/config/size_constants.dart';
import 'package:task_list/domain/entities/task_detailed_entity.dart';
import 'package:task_list/presentation/shared/custom_checkbox.dart';
import 'package:task_list/presentation/shared/loader_widget.dart';
import 'package:task_list/presentation/shared/providers/fetch_task_by_id_provider.dart';
import 'package:task_list/presentation/task/list/task_list_screen.dart';

class SeeTaskScreen extends StatelessWidget {

  static const String routeName = ':tid';


  const SeeTaskScreen({
    super.key,
    required this.taskId
  });

  final int taskId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FetchTaskByIdProvider(
        taskRepository: Injector.appInstance.get()
      )..fetchTaskDetailed(taskId: taskId),
      child: const SeeTaskScreenBuilder(),
    );
  }
}

class SeeTaskScreenBuilder extends StatelessWidget {
  const SeeTaskScreenBuilder({super.key});

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
            'Detalles',
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
          
          return SeeTaskScreenUI(
            taskDetailed: prov.taskDetailed!
          );
        },
      )
    );
  }
}


class SeeTaskScreenUI extends StatelessWidget {
  const SeeTaskScreenUI({
    super.key,
    required this.taskDetailed
  });

  final TaskDetailedEntity taskDetailed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding
      ),
      children: [
        const SizedBox(
          height: kPadding * 2,
        ),
        Text(
          'Titulo',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).hintColor
          ),
        ),
        Text(
          taskDetailed.title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 23,
            color: Theme.of(context).primaryColor
          ),
        ),
        const SizedBox(
          height: kPadding * 2,
        ),
        Text(
          'Estatus',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).hintColor
          ),
        ),
        Row(
          children: [
            CustomCheckBox(
              isCheked: taskDetailed.isCompletedAsBool,
              readonly: true,
            ),
            const SizedBox(
              width: kPadding,
            ),
            Text(
              taskDetailed.isCompletedAsBool ? 'La tarea está completada' : 'La tarea no está completada',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 20
              ),
            ),
          ],
        ),
        const SizedBox(
          height: kPadding * 2,
        ),
        Text(
          'Fecha de vencimiento',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).hintColor
          ),
        ),
        Text(
          taskDetailed.dueDate ?? 'Fecha no disponible',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 20
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
         Text(
          'Comentarios',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).hintColor
          ),
        ),
        Text(
          taskDetailed.comments ?? 'Sin comentarios',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 20
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
        Text(
          'Descripción',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).hintColor
          ),
        ),
        Text(
          taskDetailed.description ?? 'Sin descripción',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 20
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
         Text(
          'Tags',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).hintColor
          ),
        ),
        Text(
          taskDetailed.tags ?? 'Sin tags',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 20
          ),
        ),
      ],
    );
  }
}