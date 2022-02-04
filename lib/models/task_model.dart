class TaskModel {
  late int userId;
  late String title;
  late bool completed;

  TaskModel({
    required this.userId,
    required this.title,
    required this.completed,
  });

  TaskModel.fromJson(Map obj) {
    userId = obj["userId"];
    title = obj["title"];
    completed = obj["completed"];
  }
}
