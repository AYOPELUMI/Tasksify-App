import 'package:flutter/material.dart';
import 'package:task_app/TaskComponent/DialogButton.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.onSave,
    required this.taskController,
    required this.todoController,
    required this.onCancel,
    required this.todoText,
    required this.taskText,
    required this.editMode,
    required this.formKey});

  final VoidCallback onSave; 
  final VoidCallback onCancel;
  final TextEditingController taskController;
  final TextEditingController todoController; 
  final bool editMode;
  final taskText;
  final String  todoText;
  final formKey;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: SizedBox(
        height:280,
        child:  Form(
          key : formKey,
          child :Column(
          children:[
            const SizedBox(height:30,),
            TextFormField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText:"Project",
                border: OutlineInputBorder(),
                hintText:"Create a Project"),
            validator: (value){
                  if( value == null || value.isEmpty){
                    return "This field is required";
                  }
                  return null;
            },
            ),
            const SizedBox(height:20,),
            TextFormField(
              controller: todoController,
              decoration: const InputDecoration(
                labelText:"Task",
                border: OutlineInputBorder(),
                hintText:"Create a task"),
                validator: (value){
                    if( value == null || value.isEmpty){
                    return "This field is required";
                  }
                  return null;
                }
            ),
            const SizedBox(height:20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                DialogButton(
                  text: "SAVE",
                  onPressed: onSave),
                const SizedBox(width:10),
                DialogButton(
                  text: "CANCEL",
                  onPressed: onCancel)
              ]
            )
          ]
        ),
      ))
    );
  }
}