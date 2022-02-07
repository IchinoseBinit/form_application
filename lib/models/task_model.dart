class TaskModel {
  late int userId;
  late int id;
  late String title;
  late bool completed;

  // TaskModel({
  //   required this.userId,
  //   required this.title,
  //   required this.completed,
  // });

  TaskModel.fromJson(Map obj) {
    print(obj);
    userId = obj["userId"];
    id = obj["id"];
    title = obj["title"];
    completed = obj["completed"];
  }
}
