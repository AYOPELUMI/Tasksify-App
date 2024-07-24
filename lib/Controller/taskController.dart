import 'package:get/get.dart';

import '../data/taskModel.dart';

class TaskController extends GetxController{
  var tasks = <TaskModel>[
    TaskModel(
      title:"helo",
      description: "soijifjoire",
      timeofCreation: "12-12-21",
      status: false
    ),
        TaskModel(
      title:"helo",
      description: "soijifjoire",
      timeofCreation: "12-12-21",
      status: false
    ),
        TaskModel(
      title:"helo",
      description: "soijifjoire",
      timeofCreation: "12-12-21",
      status: false
    )
  ].obs;

  void addTask(TaskModel task){
    tasks.add(task);

 update();

  }

  
  void deleteTask(int index){
      tasks.removeAt(index);
  update();

  }

  void toggleTaskCompletion (int index){
    tasks[index].status = !tasks[index].status;
    update();
  }

  void  editTask( {required int index, required String description, required String title}){
    tasks[index].title = title;
    tasks[index].description = description;
  update();   

  }

  int taskCompleted(){
       int taskCompletedIndex = tasks.length;
       for(var index in tasks){
    if (index.status == true){
    }
    else{
      taskCompletedIndex-=1;
    }

   }
    return taskCompletedIndex;
  }

}