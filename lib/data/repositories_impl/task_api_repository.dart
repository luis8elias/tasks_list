import 'dart:developer';

import '/common/dio_instances.dart';
import '/domain/entities/task_entity.dart';
import '/domain/entities/task_detailed_entity.dart';
import '/data/models/api_response.dart';
import '/domain/repositories/i_task_repository.dart';

class TaskApiRepository extends ITaskRepository{

  @override
  Future<ApiResponse<List<TaskEntity>?>> getList() async{
    
    try {
     
      final response = await dioInstance.get(
        '/tasks-challenge/tasks',
      );

      final responseBody = response.data;
      if (responseBody is Map<String,dynamic>) {

        return ApiResponse(
          success: false,
          detail: responseBody['detail']
        );
        
      } 

      final tasksIterable = responseBody as Iterable;
      return ApiResponse(
        success: true,
        content: List.from(tasksIterable.map((taskJson) => TaskEntity.fromJson(taskJson))),
      );

    } catch (e) {

      log('🤡 $e');
      log('🙄 Error [class=TaskApiRepository][method=getList]');
      return ApiResponse(
        success: false,
        detail: e.toString()
      );
      
    }
  }

  @override
  Future<ApiResponse<TaskDetailedEntity>> getById({required int taskId}) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<TaskDetailedEntity>> create({required String title, required bool isCompleted, String? dueDate, String? comments, String? description, String? tags}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> delete({required int taskId}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<TaskDetailedEntity>> update({required int taskId, required String title, required bool isCompleted, String? dueDate, String? comments, String? description, String? tags}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}