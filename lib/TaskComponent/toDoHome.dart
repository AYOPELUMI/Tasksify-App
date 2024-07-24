import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_app/TaskComponent/DialogWidget.dart';

import '../Controller/taskController.dart';
import '../Widget/homeDetails.dart';
import '../Widget/homeFloatingButtons.dart';
import '../Widget/homeHeader.dart';
import '../Widget/taskDetails.dart';
import '../Widget/taskList.dart';
import '../data/taskModel.dart';


class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  final TaskController taskController = Get.find();
  final _formKey = GlobalKey<FormState>();
   final _taskController = TextEditingController();
   final _todoController = TextEditingController();
  bool isButtonSelected = true;

    void showMoreOptions(){
      setState((){
        isButtonSelected = false;
      });
    }
    void hideMoreOptions(){
      setState((){
        isButtonSelected = true;
      });
    }
  
    void cancelTask(){
        Navigator.of(context, rootNavigator: true).pop(context);
    }

    void editMode(int taskIndex){
      final _taskcontroller = TextEditingController(text:taskController.tasks[taskIndex].title);
      final todocontroller = TextEditingController(text: taskController.tasks[taskIndex].description);
           showDialog(context: context, builder: (context){
        return DialogWidget(
          formKey: _formKey,
          taskController:_taskcontroller,
          todoController: todocontroller,
          taskText: taskController.tasks[taskIndex].title,
          todoText: taskController.tasks[taskIndex].description,
          editMode: true,

          onSave: (){
            print("i am running the edit function");
                final isValid = _formKey.currentState?.validate();

                if(isValid!){
                  taskController.editTask( index: taskIndex, title: _taskcontroller.text, description: todocontroller.text);
                    Navigator.of(context, rootNavigator: true).pop(context);
                }
          },
          onCancel: (){
            cancelTask();
          }
        );
      });
    }
    void onEdit(int index){
      editMode(index);
    }
    void saveNewTask(){
      print("save task enables");
      final isValid = _formKey.currentState?.validate();
      if(isValid!){
          final now = new DateTime.now();
          String formatter =DateFormat.yMMMMd('en_US') .format(now);
          final newTask = TaskModel(title: _taskController.text,description:_todoController.text,status: false, timeofCreation:formatter);
            taskController.addTask(newTask);
                setState((){
                  _todoController.clear();
                  _taskController.clear();
                  hideMoreOptions();
                  Navigator.of(context, rootNavigator: true).pop(context);
                });
      }
    }
    
    void routeNextPage(int index){
      toRouted(index);
    }
    void toRouted(int index){
      Get.to(TaskDetails(),
      transition:Transition.rightToLeft,
      duration: Duration(seconds: 1),
      arguments:taskController.tasks[index]);
    }

    void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogWidget(
          taskController: _taskController,
          todoController: _todoController,
          taskText: "",
          todoText:"",
          editMode: false,
          formKey: _formKey,
          onSave: (){
            print("i am running the save function");
            saveNewTask();
          },
          onCancel: (){
            cancelTask();
          }
        );
      });
    }

  @override
  Widget build(BuildContext context) {

    return  GetBuilder<TaskController>(
          init: Get.find<TaskController>(),
          builder: (controller) => Scaffold(
      backgroundColor: const Color.fromARGB(255,3,65,112),
      body: Column(
          children: <Widget>
        [
          const  HomeHeader(),
          HomeDetails( controller: controller),
          Padding(
          padding:const EdgeInsets.fromLTRB(20,5.0,5,0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                height:10,
                width:10,
                child: Container(
                  decoration:BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  )
                ) 
              ),
              SizedBox(width:10),
              Text("Today Task",
                style: TextStyle(
                  color:Colors.black,
                  fontSize:20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ]
            )
          ),
          Expanded(
            flex:7,
            child:TaskList(onEdit: onEdit,
            controller: taskController,
            routeChanged:routeNextPage))
        ]
        ),
        floatingActionButton: HomeFloatingButtons(addTask:createNewTask, showMoreOptions: showMoreOptions,hideMoreOptions: hideMoreOptions, isButtonSelected : isButtonSelected),
        ));
  }
}
