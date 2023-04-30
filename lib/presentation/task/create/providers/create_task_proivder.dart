import 'package:flutter/material.dart';
import '/data/models/api_response.dart';
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

  Future<void> createTask() async {

    _emitStatus(CreateTaskStatus.loading);
    /* final createTaskResp = await _taskRepository.create(
      title: title, isCompleted: isCompleted
    ) */
    await Future.delayed(const Duration(seconds: 2));
    final createTaskResp = ApiResponse(success: true, detail: 'Tarea creada con exito');

    if(createTaskResp.isFailed){

      message = createTaskResp.detail!;
      _emitStatus(CreateTaskStatus.failed);

    }

    message = createTaskResp.detail!;
    _emitStatus(CreateTaskStatus.success);

  }

  void resetStatus(){
    status = CreateTaskStatus.initial;
    message = '';
  }


 

 
}