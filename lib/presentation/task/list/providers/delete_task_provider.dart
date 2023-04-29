import 'package:flutter/foundation.dart';

import '/domain/repositories/i_task_repository.dart';
import '/presentation/task/list/providers/task_list_provider.dart';

enum DeleteTaskStatus{
  initial,
  loading,
  success,
  failed
}

class DeleteTaskPrivider extends ChangeNotifier{

  final TaskListProvider _taskListProvider;
  final ITaskRepository _taskRepository;
  

  DeleteTaskPrivider({
    required TaskListProvider taskListProvider,
    required ITaskRepository taskRepository
    
  }) : 
  _taskListProvider = taskListProvider,
  _taskRepository = taskRepository;


  DeleteTaskStatus status = DeleteTaskStatus.initial;
  String message = '';

  _emitStatus(DeleteTaskStatus newStatus){
    status = newStatus;
    notifyListeners();
  }

  Future<void> deleteTask(int taskId) async {
    
    _emitStatus(DeleteTaskStatus.loading);
    final deleteTaskResp = await _taskRepository.delete(taskId: taskId);
    message = deleteTaskResp.detail!;

    if(deleteTaskResp.isFailed){

      _emitStatus(DeleteTaskStatus.failed);
      return;

    }

    _emitStatus(DeleteTaskStatus.success);
    _taskListProvider.deleteTask(taskId);

  }

  void resetStatus(){
    status = DeleteTaskStatus.initial;
    message = '';
  }

}