import 'package:flutter/widgets.dart';

import '../TaskComponent/Task_Widget.dart';

class TaskList extends StatelessWidget {
  final Function(int) onEdit ;
  final Function(int) routeChanged;
  final controller; 

  TaskList({super.key, required this.onEdit, this.controller, required this.routeChanged});
  @override
  Widget build(BuildContext context) {
      return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index){
            final task = controller.tasks[index];
            return TaskWidget(
              taskName:task.title,
              todoName:task.description,
              taskCompleted:task.status,
              onChanged: (value) => controller.toggleTaskCompletion(index),
              onDelete: (value) => controller.deleteTask(index),
              onEdit : (value) => onEdit(index),
              taskDetails: task);
          },
      );
  }
}