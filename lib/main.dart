import 'package:flutter/material.dart';
import 'package:task_app/HomeScreen.dart';
import 'package:task_app/Login.dart';

import 'LoginScreen.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      '/login': (context) => FormScreen(),
      '/dashboard': (context) =>ToDoApp(),
    },
  ),
);

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Task List",
        theme: ThemeData(primaryColor: Colors.blue),
        home: const BottomNavigationExample(),
        debugShowCheckedModeBanner: true
    );
  }
}