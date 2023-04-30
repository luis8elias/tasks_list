import 'package:flutter/material.dart';
import '/domain/repositories/i_task_repository.dart';

enum CreateTaskStatus{
  initial,
  loading,
  success,
  failed
}

class CreateTaskProivder extends ChangeNotifier {

  final ITaskRepository _taskRepository;

  CreateTaskProivder({
    required ITaskRepository taskRepository
  }) : _taskRepository = taskRepository;

  _emitStatus(CreateTaskStatus newStatus){
    status = newStatus;
    notifyListeners();
  }

  CreateTaskStatus status = CreateTaskStatus.initial;
  String message = '';

  Future<void> createTask({
    required String title,
    required bool isCompleted,
    required String dueDate,
    required String comments,
    required String description,
    required String tags
  }) async {

    _emitStatus(CreateTaskStatus.loading);
    final createTaskResp = await _taskRepository.create(
      title: title, 
      isCompleted: isCompleted,
      dueDate: dueDate,
      comments: comments,
      description: description,
      tags: tags
    );
    
    if(createTaskResp.isFailed){

      message = createTaskResp.detail!;
      _emitStatus(CreateTaskStatus.failed);
      return;

    }

    message = createTaskResp.detail!;
    _emitStatus(CreateTaskStatus.success);

  }

 
}