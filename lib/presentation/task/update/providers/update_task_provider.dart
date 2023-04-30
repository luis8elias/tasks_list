import 'package:flutter/material.dart';

import '/domain/repositories/i_task_repository.dart';

enum UpdateTaskStatus{
  initial,
  loading,
  success,
  failed
}

class UpdateTaskProvider extends ChangeNotifier {

  final ITaskRepository _taskRepository;

  UpdateTaskProvider({
    required ITaskRepository taskRepository
  }) : _taskRepository = taskRepository;

  _emitStatus(UpdateTaskStatus newStatus){
    status = newStatus;
    notifyListeners();
  }

  UpdateTaskStatus status = UpdateTaskStatus.initial;
  String message = '';

  Future<void> updateTask({
    required int taskId,
    required String title,
    required bool isCompleted,
    required String dueDate,
    required String comments,
    required String description,
    required String tags
  }) async {

    _emitStatus(UpdateTaskStatus.loading);
    final updateTaskResp = await _taskRepository.update(
      taskId: taskId,
      title: title, 
      isCompleted: isCompleted,
      dueDate: dueDate,
      comments: comments,
      description: description,
      tags: tags
    );
    
    if(updateTaskResp.isFailed){

      message = updateTaskResp.detail!;
      _emitStatus(UpdateTaskStatus.failed);
      return;

    }

    message = updateTaskResp.detail!;
    _emitStatus(UpdateTaskStatus.success);

  }

  void resetStatus(){
    status = UpdateTaskStatus.initial;
    message = '';
  }
 
}