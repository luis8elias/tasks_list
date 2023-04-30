import '/domain/entities/task_entity.dart';

class TaskDetailedEntity extends  TaskEntity{

  String? comments;
  String? description;
  String? tags;
  DateTime? createdAt;
  DateTime? updatedAt;

  TaskDetailedEntity({
    required super.id,
    required super.title,
    required super.isCompleted,
    super.dueDate,
    this.comments,
    this.description,
    this.tags,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskDetailedEntity.fromJson(Map<String, dynamic> json) {

    final isCompletedFromJson = json["is_completed"];
    return TaskDetailedEntity(
    id: json["id"],
    title: json["title"],
    isCompleted: isCompletedFromJson is int ? isCompletedFromJson : int.parse(isCompletedFromJson),
    dueDate: json["due_date"],
    comments: json["comments"],
    description: json["description"],
    tags: json["tags"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "is_completed": isCompleted,
    "due_date": dueDate,
    "comments": comments,
    "description": description,
    "tags": tags,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}