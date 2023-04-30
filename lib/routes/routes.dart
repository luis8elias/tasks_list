import 'package:go_router/go_router.dart';
import '/presentation/task/see/see_task_screen.dart';

import '/presentation/task/update/update_task_screen.dart';
import '/presentation/task/create/create_task_screen.dart';
import '/presentation/task/list/task_list_screen.dart';



final routes = [

  GoRoute(
    path: TaskListScreen.routeName,
    name: TaskListScreen.routeName,
    builder: (context, state) => const TaskListScreen(),
    routes: [
      GoRoute(
        path: CreateTaskScreen.routeName,
        name: CreateTaskScreen.routeName,
        builder: (context, state) => const CreateTaskScreen(),
      ),
      GoRoute(
        path: UpdateTaskScreen.routeName,
        name: UpdateTaskScreen.routeName,
        builder: (context, state) => UpdateTaskScreen(
          taskId:  int.parse(state.params['tid']!),
        ),
      ),
      GoRoute(
        path: SeeTaskScreen.routeName,
        name: SeeTaskScreen.routeName,
        builder: (context, state) => SeeTaskScreen(
          taskId:  int.parse(state.params['tid']!),
        ),
      ),
    ]
  ),


];

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: routes,
  initialLocation: TaskListScreen.routeName
);