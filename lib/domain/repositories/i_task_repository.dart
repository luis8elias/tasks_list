import '/data/models/api_response.dart';

import '/domain/entities/task_detailed_entity.dart';
import '/domain/entities/task_entity.dart';

abstract class ITaskRepository {
  Future<ApiResponse<List<TaskEntity>?>> getList();
  Future<ApiResponse<TaskDetailedEntity>> getById({required int taskId});
  Future<ApiResponse<TaskDetailedEntity>> create({
    required String title,
    required bool isCompleted,
    String? dueDate,
    String? comments,
    String? description,
    String? tags
  });
  Future<ApiResponse<TaskDetailedEntity>> update({
    required int taskId,
    required String title,
    required bool isCompleted,
    String? dueDate,
    String? comments,
    String? description,
    String? tags
  });
  Future<ApiResponse> delete({required int taskId});
}