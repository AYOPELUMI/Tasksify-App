import 'package:flutter/material.dart';
import 'package:task_app/TaskComponent/DialogButton.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.onSave,
    required this.taskController,
    required this.todoController,
    required this.onCancel});

  final VoidCallback onSave; 
  final VoidCallback onCancel;
  final TextEditingController taskController;
  final TextEditingController todoController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: SizedBox(
        height:250,
        child:  Column(
          children:[
            const SizedBox(height:30,),
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Create a task"),
            ),
            const SizedBox(height:20,),
            TextField(
              controller: todoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Create a task"),
            ),
            const SizedBox(height:20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                DialogButton(
                  text: "save",
                  onPressed: onSave),
                const SizedBox(width:10),
                DialogButton(
                  text: "Cancel",
                  onPressed: onCancel)
              ]
            )
          ]
        ),
      )
    );
  }
}