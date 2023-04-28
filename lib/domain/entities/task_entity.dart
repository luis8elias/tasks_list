class TaskEntity {

  int id;
  String title;
  int isCompleted;
  String? dueDate;
  String? comments;
  String? description;
  String? tags;
  DateTime? createdAt;
  DateTime? updatedAt;

  TaskEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.dueDate,
    this.comments,
    this.description,
    this.tags,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) => TaskEntity(
    id: json["id"],
    title: json["title"],
    isCompleted: json["is_completed"],
    dueDate: json["due_date"],
    comments: json["comments"],
    description: json["description"],
    tags: json["tags"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

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
