import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Todo task;
  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! ? Colors.grey : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // widget.task.type == Tasktype.note
            //     ? Image.asset('lib/assets/images/Category.png')
            //     : widget.task.type == Tasktype.calendar
            //         ? Image.asset('lib/assets/images/Category1.png')
            //         : Image.asset('lib/assets/images/Category2.png'),
            Image.asset('lib/assets/images/Category2.png'),

            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(
                      decoration: widget.task.completed == true
                          ? TextDecoration.lineThrough
                          : null,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    widget.task.userId!.toString(),
                    style: TextStyle(
                      decoration: widget.task.completed == true
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  )
                ],
              ),
            ),
            Checkbox(
                value: widget.task.completed,
                onChanged: (val) {
                  setState(() {
                    widget.task.completed = val!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
