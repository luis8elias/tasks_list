import 'package:flutter/foundation.dart';

import '/domain/entities/task_entity.dart';
import '/domain/repositories/i_task_repository.dart';

enum ActionStatus{
  loading,
  success,
  failed
}

class TaskListProvider with ChangeNotifier {

  final ITaskRepository _taskRepository;

  TaskListProvider({
    required ITaskRepository taskRepository
  }) : _taskRepository = taskRepository;

  ActionStatus status = ActionStatus.loading;
  String message = '';
  List<TaskEntity> tasks = [];

  _emitStatus(ActionStatus newStatus){
    status = newStatus;
    notifyListeners();
  }
  

  Future<void> fetchTaskList() async {
  
    final fetchTasksResponse = await _taskRepository.getList();
    if(fetchTasksResponse.isFailed){

      message = fetchTasksResponse.detail!;
      _emitStatus(ActionStatus.failed);
      return;

    }

    tasks = fetchTasksResponse.content!;
    _emitStatus(ActionStatus.success);

  }

}