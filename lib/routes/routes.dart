import 'package:flutter/material.dart' show Widget, UniqueKey;
import 'package:go_router/go_router.dart';
import '/presentation/task/create/create_task_screen.dart';
import '/presentation/task/list/task_list_screen.dart';

GoRoute _goRouteNamed({
  required String name,
  required Widget screen,
  List<RouteBase> routes = const[],
 }){
  return GoRoute(
    name: name,
    path: name,
    pageBuilder: (context, state) {
      return CustomTransitionPage<void>(
        key: UniqueKey(),
        child: screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child
      );
    },
    routes: routes,
  );
}

final routes = [

  _goRouteNamed(
    name: TaskListScreen.routeName,
    screen: const TaskListScreen(),
    routes: [
      _goRouteNamed(
        name: CreateTaskScreen.routeName,
        screen: const CreateTaskScreen(),
      ),
    ]
  ),

];

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: routes,
  initialLocation: TaskListScreen.routeName
);