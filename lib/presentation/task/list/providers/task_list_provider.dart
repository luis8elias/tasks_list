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

  _updateTasksCounts(){
    completedTaskCount = tasks.where((element) => element.isCompletedAsBool).length;
    notCompletedTaskCount = tasks.length - completedTaskCount;
  }

  List<TaskEntity> _filterTasks(List<TaskEntity> taskToFilter){

    if(taskFilter == TaskFilter.completed){
      return taskToFilter.where((element) => element.isCompletedAsBool).toList();
    }

    if(taskFilter == TaskFilter.notCompleted){
      return taskToFilter.where((element) => element.isNotCompleted).toList();
    }

    return taskToFilter;

  }
  

  Future<void> fetchTaskList() async {
    
    _emitStatus(TaskListStatus.loading);
    final fetchTasksResponse = await _taskRepository.getList();
    if(fetchTasksResponse.isFailed){

      message = fetchTasksResponse.detail!;
      _emitStatus(TaskListStatus.failed);
      return;

    }

    tasks = fetchTasksResponse.content!;
    filteredTasks = _filterTasks(fetchTasksResponse.content!);
    _updateTasksCounts();
    _emitStatus(TaskListStatus.success);

  }

  void changeTaskFilter(TaskFilter newTaskFilter){

    if(newTaskFilter == taskFilter) return;
    taskFilter = newTaskFilter;
    filteredTasks = _filterTasks(tasks);
    _emitStatus(TaskListStatus.success);

  }


  void deleteTask (int taskId){
    
    tasks = List.of(tasks)..removeWhere(
      (task) => task.id == taskId,
    );
    filteredTasks = tasks;
    _updateTasksCounts();
    _emitStatus(TaskListStatus.success);

  }

  

}