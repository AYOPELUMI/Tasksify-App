import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.taskName,
    required this.todoName,
    required this.taskCompleted,
    this.onChanged,
    this.onDelete,
    this.onEdit});

    final String taskName;
    final String todoName;
    final bool taskCompleted;
    final Function(bool?)? onChanged;
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
        child:  Container(
        padding:const EdgeInsets.symmetric(horizontal:4, vertical : 5),
        margin: EdgeInsets.only(left:10, right:10, bottom:10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: ListTile(
        leading: Transform.scale(
          scale:1.6,
          child:Checkbox(
          value: taskCompleted,
          onChanged: onChanged,
          shape: const CircleBorder(),
            side: MaterialStateBorderSide.resolveWith(
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
        );
  }
}