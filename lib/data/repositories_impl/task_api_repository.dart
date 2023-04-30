import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

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
  Future<ApiResponse<TaskDetailedEntity>> getById({required int taskId}) async{
    try {
      
      final response = await dioInstance.get(
        '/tasks-challenge/tasks/$taskId',
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
        content: TaskDetailedEntity.fromJson(tasksIterable.first),
      );

    } catch (e) {

      log('🤡 $e');
      log('🙄 Error [class=TaskApiRepository][method=getById]');
      return ApiResponse(
        success: false,
        detail: e.toString()
      );
      
    }
  }

  @override
  Future<ApiResponse<TaskDetailedEntity>> create({
    required String title, 
    required bool isCompleted, 
    String? dueDate, 
    String? comments, 
    String? description, 
    String? tags
  }) async {

    try{

      final params = {
        'title': title,
        'is_completed': isCompleted ? 1 : 0
      };

      if(dueDate!.isNotEmpty){
        params.addAll({
          'due_date' : dueDate
        });
      }

      if(comments!.isNotEmpty){
        params.addAll({
          'comments' : comments
        });
      }

      if(description!.isNotEmpty){
        params.addAll({
          'description' : description,
        });
      }

      if(tags!.isNotEmpty){
        params.addAll({
          'tags' : tags,
        });
      }

      final response = await dioInstance.post(
        "/tasks-challenge/tasks",
        data: jsonEncode(params),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader : 'application/x-www-form-urlencoded'
          }
        )
      );

      final responseBody = response.data as Map<String,dynamic>;

      if (responseBody.containsKey('content')) {
        return ApiResponse(
          success: false,
          detail: responseBody['detail'],
        );
      }
      
      return ApiResponse(
        success: true,
        detail: responseBody['detail'],
        content: TaskDetailedEntity.fromJson(responseBody['task'])
      );
      

    } catch (e) {
      log('🤡 $e');
      log('🙄 Error [class=TaskApiRepository][method=create]');
      return ApiResponse(
        success: false,
        detail: "Error"
      );
    }
  }

  @override
  Future<ApiResponse> delete({required int taskId}) async{
    try{

      final response = await dioInstance.delete(
        "/tasks-challenge/tasks/$taskId",
      );

      final responseBody = response.data as Map<String,dynamic>;

      if(responseBody.containsKey('content')){
        
        return ApiResponse(
          success: false,
          detail: responseBody['detail'],
        );

      }

      return ApiResponse(
        success: true,
        detail: responseBody['detail'],
      );

    } catch (e) {

      log('🤡 $e');
      log('🙄 Error [class=TaskApiRepository][method=delete]');
      return ApiResponse(
        success: false,
        detail: 'Ocurrió un error al borrar la tarea'
      );
    }
  }

  @override
  Future<ApiResponse<TaskDetailedEntity>> update({
    required int taskId,
    required String title, 
    required bool isCompleted, 
    String? dueDate, 
    String? comments, 
    String? description, 
    String? tags
  }) async{
    try{

      final params = {
        'title': title,
        'is_completed': isCompleted ? 1 : 0
      };

      if(dueDate!.isNotEmpty){
        params.addAll({
          'due_date' : dueDate
        });
      }

      if(comments!.isNotEmpty){
        params.addAll({
          'comments' : comments
        });
      }

      if(description!.isNotEmpty){
        params.addAll({
          'description' : description,
        });
      }

      if(tags!.isNotEmpty){
        params.addAll({
          'tags' : tags,
        });
      }

      final response = await dioInstance.put(
        "/tasks-challenge/tasks/$taskId",
        data: jsonEncode(params),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader : 'application/x-www-form-urlencoded'
          }
        )
      );

      final responseBody = response.data as Map<String,dynamic>;

      if (responseBody.containsKey('content')) {
        return ApiResponse(
          success: false,
          detail: responseBody['detail'],
        );
      }
      
      return ApiResponse(
        success: true,
        detail: responseBody['detail'],
        content: TaskDetailedEntity.fromJson(responseBody['task'])
      );
      

    } catch (e) {
      log('🤡 $e');
      log('🙄 Error [class=TaskApiRepository][method=update]');
      return ApiResponse(
        success: false,
        detail: "Error"
      );
    }
  }
}