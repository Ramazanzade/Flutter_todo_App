import 'package:flutter/material.dart';
import 'package:todo/screens/ad_new_task.dart';
import 'package:todo/todoItem.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => HomescreenState();
}

List<String> todo = ['Study Lessons', 'Run 5K', 'Go to party'];
List<String> completed = ['Game meetup', 'Take out trash'];

class HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    double dublewidth = MediaQuery.of(context).size.width;
    double dubleheight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[350],
          body: Column(children: [
            Container(
                width: dublewidth,
                height: dubleheight / 4,
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
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: todo.length,
                        itemBuilder: (context, index) {
                          return Todoitem(title: todo[index]);
                        }),
                  )),
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
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: completed.length,
                        itemBuilder: (context, index) {
                          return Todoitem(title: completed[index]);
                        }),
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AddNew()));
                },
                child: const Text('Add New Task'))
          ]),
        ),
      ),
    );
  }
}
