import 'package:flutter/material.dart';
import 'package:to_do_2/todo_main_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "a simple todo app ",
      debugShowCheckedModeBanner: false,
      home:  const ToDoMainActivity(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}


