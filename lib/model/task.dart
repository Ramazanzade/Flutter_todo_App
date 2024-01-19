import 'package:todo/constans/tasktype.dart';

class Task {
  Task(
      {required this.title,
      required this.description,
      required this.check,
      required this.type});
  final String title;
  final String description;
  bool check;
  final Tasktype type;
}
