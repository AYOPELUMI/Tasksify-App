import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.taskName,
    required this.todoName,
    required this.taskCompleted,
    this.onChanged,
    this.onDelete});

    final String taskName;
    final String todoName;
    final bool taskCompleted;
    final Function(bool?)? onChanged;
    final Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.symmetric(horizontal:10, vertical : 20),
        child: Slidable(
          endActionPane: ActionPane(
            motion:const StretchMotion(),
            children:[
              SlidableAction(
                onPressed: onDelete,
                icon:Icons.delete,
                backgroundColor: Colors.red,
                borderRadius:BorderRadius.circular(10))
            ]
          ),
        child:  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: ListTile(
        leading: Checkbox(
          value: taskCompleted,
          onChanged: onChanged,
          shape: const CircleBorder(),
            side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.0, color: Colors.grey),
  ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(taskName,
              style: TextStyle(color:Colors.grey,
              fontSize:12,),),
            Text(todoName,
              style: TextStyle(color:Colors.black,fontSize:20,),)
             ]
         )
      )
        )
        )
      );
  }
}