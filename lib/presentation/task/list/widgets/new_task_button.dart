import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/presentation/task/create/create_task_screen.dart';

import '/presentation/shared/buttons.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: ButtonWithIcon(
        icon: Icons.add,
        text: 'Nueva Tarea',
        onPressed: (){
          GoRouter.of(context).pushNamed(
            CreateTaskScreen.routeName
          );
        },
      ),
    );
  }
}