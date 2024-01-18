import 'package:flutter/material.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.title});
  final String title;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  @override
  Widget build(BuildContext context) {
    bool ischeck = false;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.safety_check,
              size: 40,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            Checkbox(
                value: ischeck,
                onChanged: (val) => {
                      setState(() {
                        ischeck = val!;
                      })
                    })
          ],
        ),
      ),
    );
  }
}
