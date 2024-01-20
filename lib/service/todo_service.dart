import 'dart:convert';
import 'package:todo/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoSercive {
  final String url = 'https://dummyjson.com/todos/';
  final String posturl = 'https://dummyjson.com/todos/add';

  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> res = jsonDecode(response.body)['todos'];
    List<Todo> todo = List.empty(growable: true);

    res.forEach((element) {
      Todo task = Todo.fromJson(element);
      if (task.completed! == false) {
        todo.add(task);
      }
    });
    return todo;
  }

  Future<List<Todo>> getcompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> res = jsonDecode(response.body)['todos'];
    List<Todo> todo = List.empty(growable: true);

    res.forEach((element) {
      Todo task = Todo.fromJson(element);
      if (task.completed! == true) {
        todo.add(task);
      }
    });
    return todo;
  }

  Future<String> addtodo(Todo newtodo) async {
    final respone = await http.post(Uri.parse(posturl),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8'
        },
        body: jsonEncode(newtodo.toString()));
    print(respone.body);
    return respone.body;
  }
}
