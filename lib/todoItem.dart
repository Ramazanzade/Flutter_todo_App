import 'package:flutter/material.dart';
import 'package:todo/constans/tasktype.dart';
import 'package:todo/model/task.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Task task;
  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.check == true ? Colors.grey : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == Tasktype.note
                ? Image.asset('lib/assets/images/Category.png')
                : widget.task.type == Tasktype.calendar
                    ? Image.asset('lib/assets/images/Category1.png')
                    : Image.asset('lib/assets/images/Category2.png'),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      decoration: widget.task.check == true
                          ? TextDecoration.lineThrough
                          : null,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(
                      decoration: widget.task.check == true
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  )
                ],
              ),
            ),
            Checkbox(
                value: widget.task.check,
                onChanged: (val) {
                  setState(() {
                    widget.task.check = val!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
