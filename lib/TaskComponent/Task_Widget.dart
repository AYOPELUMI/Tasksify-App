import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../Widget/taskDetails.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.taskName,
    required this.todoName,
    required this.taskCompleted,
    this.onChanged,
    this.onDelete,
    this.onEdit,
    required this.taskDetails});

    final String taskName;
    final String todoName;
    final bool taskCompleted;
    final Function(bool?)? onChanged;
    final taskDetails;
    final Function(BuildContext)? onDelete;
    final Function(BuildContext)? onEdit;

  @override
  Widget build(BuildContext context) {
    return Slidable(
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
          startActionPane: ActionPane(
            motion:const StretchMotion(),
            children:[
              SlidableAction(
                onPressed: onEdit,
                icon:Icons.edit,
                backgroundColor: Colors.blue,
                borderRadius:BorderRadius.circular(10))
            ]
          ),
        child:  TextButton(
          onPressed:() => {
              Get.to(TaskDetails(),
      transition:Transition.rightToLeft,
      duration: Duration(milliseconds: 500),
      arguments:taskDetails)
          },
         child:Container(
        padding:const EdgeInsets.symmetric(horizontal:4, vertical : 5),
        margin: EdgeInsets.only(left:5, right:5, bottom:5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
            boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(-3,0),
                ),
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(3,0),
                ) // no shadow color set, defaults to black
            ]
        ),
        child: ListTile(
        leading: Transform.scale(
          scale:1.6,
          child:Checkbox(
          value: taskCompleted,
          onChanged: onChanged,
          shape: const CircleBorder(),
            side: WidgetStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.0, color: Colors.grey),
  ),
        )),
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
    ));
  }
}