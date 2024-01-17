import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool ischeck = false;
  @override
  Widget build(BuildContext context) {
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
            Column(
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.safety_check,
                        size: 40,
                      ),
                      const Text(
                        'Study Lessons',
                        style: TextStyle(
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
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
