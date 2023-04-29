import 'package:flutter/foundation.dart';

import '/domain/entities/task_entity.dart';
import '/domain/repositories/i_task_repository.dart';

enum TaskListStatus{
  loading,
  success,
  failed
}

enum TaskFilter{
  all,
  completed,
  notCompleted
}

class TaskListProvider with ChangeNotifier {

  final ITaskRepository _taskRepository;

  TaskListProvider({
    required ITaskRepository taskRepository
  }) : _taskRepository = taskRepository;

  TaskListStatus status = TaskListStatus.loading;
  TaskFilter taskFilter = TaskFilter.all;
  String message = '';
  List<TaskEntity> tasks = [];
  List<TaskEntity> filteredTasks = [];
  int completedTaskCount = 0;
  int notCompletedTaskCount = 0;

  _emitStatus(TaskListStatus newStatus){
    status = newStatus;
    notifyListeners();
  }

  _updateCounts(){
    completedTaskCount = tasks.where((element) => element.isCompletedAsBool).length;
    notCompletedTaskCount = tasks.length - completedTaskCount;
  }
  

  Future<void> fetchTaskList() async {
    
    final fetchTasksResponse = await _taskRepository.getList();
    if(fetchTasksResponse.isFailed){

      message = fetchTasksResponse.detail!;
      _emitStatus(TaskListStatus.failed);
      return;

    }

    tasks = fetchTasksResponse.content!;
    filteredTasks = fetchTasksResponse.content!;
    _updateCounts();
    _emitStatus(TaskListStatus.success);

  }

  void changeTaskFilter(TaskFilter newTaskFilter){

    if(newTaskFilter == taskFilter) return;

    taskFilter = newTaskFilter;

    if(newTaskFilter == TaskFilter.all){
      filteredTasks = tasks;
    }

    if(newTaskFilter == TaskFilter.completed){
      filteredTasks = tasks.where((element) => element.isCompletedAsBool).toList();
    }

    if(newTaskFilter == TaskFilter.notCompleted){
      filteredTasks = tasks.where((element) => element.isNotCompleted).toList();
    }

    _emitStatus(TaskListStatus.success);

  }


  void deleteTask (int taskId){
    
    tasks = List.of(tasks)..removeWhere(
      (task) => task.id == taskId,
    );
    filteredTasks = tasks;
    _updateCounts();
    _emitStatus(TaskListStatus.success);

  }

  

}