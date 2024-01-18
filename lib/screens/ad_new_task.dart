import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    decoration:
                        InputDecoration(filled: true, fillColor: Colors.white),
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
                        },
                        child: Image.asset('lib/assets/images/Category.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(microseconds: 300),
                                  content: Text('kjdsajdikslj')));
                        },
                        child: Image.asset('lib/assets/images/Category1.png'),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(microseconds: 300),
                                  content: Text('kjdsajdikslj')));
                        },
                        child: Image.asset('lib/assets/images/Category2.png'),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Date'),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: true, fillColor: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Time'),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: InputDecoration(
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
                const SizedBox(
                  height: 300,
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.white, isDense: true),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
