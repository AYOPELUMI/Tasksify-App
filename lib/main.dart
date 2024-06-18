import 'package:flutter/material.dart';
import 'package:task_app/LoginScreen.dart';


void main() {
  runApp(ToDoApp());
}


class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Task List",
        theme: ThemeData(primaryColor: Colors.blue),
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false
    );
  }
}