import 'package:flutter/material.dart';
import 'package:todo/constans/tasktype.dart';
import 'package:todo/model/task.dart';
import 'package:todo/screens/ad_new_task.dart';
import 'package:todo/service/todo_service.dart';
import 'package:todo/todoItem.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => HomescreenState();
}

//List<String> todo = ['Study Lessons', 'Run 5K', 'Go to party'];
//List<String> completed = ['Game meetup', 'Take out trash'];
List<Task> todo = [
  Task(
      type: Tasktype.note,
      title: 'salam',
      description: 'description',
      check: false),
  Task(
      type: Tasktype.calendar,
      title: 'sala1m',
      description: 'descripti1on',
      check: false),
  Task(
      type: Tasktype.contest,
      title: 'sal34am',
      description: 'descr2iption',
      check: false),
];
List<Task> completed = [
  Task(
      type: Tasktype.calendar,
      title: 'sala1m',
      description: 'descripti1on',
      check: false),
  Task(
      type: Tasktype.contest,
      title: 'sal34am',
      description: 'descr2iption',
      check: false),
];

class HomescreenState extends State<Homescreen> {
  void addnewtask(Task newtask) {
    setState(() {
      todo.add(newtask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoSercive todoSercive = TodoSercive();
    todoSercive.getTodos();
    double dublewidth = MediaQuery.of(context).size.width;
    double dubleheight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[350],
          body: Column(children: [
            Container(
                width: dublewidth,
                height: dubleheight / 7,
                color: Colors.purple,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Yanvar 16 2024',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'My Todo List',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                          future: todoSercive.getTodos(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const CircularProgressIndicator();
                            } else {
                              return ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Todoitem(
                                        task: snapshot.data![index]);
                                  });
                            }
                          }))),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Completed',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                        future: todoSercive.getcompletedTodos(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return const CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Todoitem(task: snapshot.data![index]);
                                });
                          }
                        }),
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNew(
                            addnewtask: (newtask) => addnewtask(newtask),
                          )));
                },
                child: const Text('Add New Task'))
          ]),
        ),
      ),
    );
  }
}
