import 'package:flutter/material.dart' show Widget;
import 'package:go_router/go_router.dart';
import '/presentation/task/list/task_list_screen.dart';

GoRoute _goRouteNamed({
  required String name,
  required Widget screen,
  List<RouteBase> routes = const[],
 }){
  return GoRoute(
    name: name,
    path: name,
    builder: (context, state) => screen,
    routes: routes,
  );
}

final routes = [

  _goRouteNamed(
    name: TaskListScreen.routeName,
    screen: const TaskListScreen(),
  ),

];

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: routes,
  initialLocation: TaskListScreen.routeName
);