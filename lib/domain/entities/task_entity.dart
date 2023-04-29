class TaskEntity {

  int id;
  String title;
  int isCompleted;
  String? dueDate;

  TaskEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.dueDate,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) => TaskEntity(
    id: json["id"],
    title: json["title"],
    isCompleted: json["is_completed"],
    dueDate: json["due_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "is_completed": isCompleted,
    "due_date": dueDate,
  };
}
