import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Controller/taskController.dart';
import '../TaskComponent/Task_Widget.dart';

class TaskList extends StatelessWidget {
  final TaskController taskController = Get.find();
  final Function(int) onEdit ;

  TaskList({super.key, required this.onEdit});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taskController.tasks.length,
        itemBuilder: (context, index){
          final task = taskController.tasks[index];
          return TaskWidget(
            taskName:task.title,
            todoName:task.description,
            taskCompleted:task.status,
            onChanged: (value) => taskController.toggleTaskCompletion(index),
            onDelete: (value) => taskController.deleteTask(index),
            onEdit : (value) => onEdit(index));
        },
        );
  }
}