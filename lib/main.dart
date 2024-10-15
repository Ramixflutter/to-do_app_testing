import 'package:flutter/material.dart';
import 'package:flutter_testing_part2/Task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskScreen(),
    );
  }
}

