import 'package:flutter/material.dart';
import 'package:todo/constans/tasktype.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/service/todo_service.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key, required this.addnewtask});
  final void Function(Task newtask) addnewtask;

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  TextEditingController titlecontruler = TextEditingController();
  TextEditingController datecontruler = TextEditingController();
  TextEditingController timecontruler = TextEditingController();
  TextEditingController notecontruler = TextEditingController();
  TodoSercive todoSercive = TodoSercive();
  Tasktype tasktype = Tasktype.note;
  @override
  Widget build(BuildContext context) {
    double dublewidth = MediaQuery.of(context).size.width;
    double dubleheight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[350],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: dublewidth,
                  height: dubleheight / 10,
                  color: Colors.purple,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 40,
                            color: Colors.white,
                          )),
                      const Expanded(
                          child: Text(
                        'Add New Task',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Task title')),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    controller: titlecontruler,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Category'),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(microseconds: 300),
                                  content: Text('kjdsajdikslj')));
                          setState(() {
                            tasktype = Tasktype.note;
                          });
                        },
                        child: Image.asset('lib/assets/images/Category.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(microseconds: 300),
                                  content: Text('kjdsajdikslj')));
                          setState(() {
                            tasktype = Tasktype.calendar;
                          });
                        },
                        child: Image.asset('lib/assets/images/Category1.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(microseconds: 300),
                                  content: Text('kjdsajdikslj')));
                          setState(() {
                            tasktype = Tasktype.contest;
                          });
                        },
                        child: Image.asset('lib/assets/images/Category2.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text('Date'),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: datecontruler,
                                  decoration: const InputDecoration(
                                      filled: true, fillColor: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text('Time'),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: timecontruler,
                                  decoration: const InputDecoration(
                                      filled: true, fillColor: Colors.white),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 20), child: Text('Note')),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: 300,
                    child: TextField(
                      controller: notecontruler,
                      expands: true,
                      maxLines: null,
                      decoration: const InputDecoration(
                          filled: true, fillColor: Colors.white, isDense: true),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      saveTodo();
                      // Task newtask = Task(
                      //     title: titlecontruler.text,
                      //     description: notecontruler.text,
                      //     check: false,
                      //     type: tasktype);
                      // widget.addnewtask(newtask);
                      Navigator.pop(context);
                    },
                    child: const Text('Save'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    Todo newtodo = Todo(
        id: -1,
        completed: false,
        todo: titlecontruler.text,
        userId: int.parse(datecontruler.text));
    todoSercive.addtodo(newtodo);
  }
}
