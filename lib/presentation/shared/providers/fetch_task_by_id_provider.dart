import 'package:flutter/material.dart';
import '/domain/entities/task_detailed_entity.dart';
import '/domain/repositories/i_task_repository.dart';


enum TaskDetailsStatus{
  loading,
  success,
  failed
}

class FetchTaskByIdProvider extends ChangeNotifier{

  final ITaskRepository _taskRepository;

  FetchTaskByIdProvider({
    required ITaskRepository taskRepository
  }) : _taskRepository = taskRepository;

  _emitStatus(TaskDetailsStatus newStatus){
    status = newStatus;
    notifyListeners();
  }

  TaskDetailsStatus status = TaskDetailsStatus.loading;
  String message = '';
  TaskDetailedEntity? taskDetailed;


  Future<void> fetchTaskDetailed({required taskId}) async{
   

    final taskDetailsResp = await _taskRepository.getById(taskId: taskId);
    

    if(taskDetailsResp.isFailed){

      message == taskDetailsResp.detail;
      _emitStatus(TaskDetailsStatus.failed);
      return;

    }

    message == taskDetailsResp.detail;
    taskDetailed = taskDetailsResp.content;
    _emitStatus(TaskDetailsStatus.success);
    
  }
  
}