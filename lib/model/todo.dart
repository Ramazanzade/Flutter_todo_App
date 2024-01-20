class Todo {
  Todo(
      {required this.id,
      required this.completed,
      required this.todo,
      required this.userId});
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}
