import 'package:get/get.dart';

import '../data/taskModel.dart';

class TaskController extends GetxController{
  var tasks = <TaskModel>[].obs;

  void addTask(TaskModel task){
    tasks.add(task);
  }

  
  void deleteTask(int index){
      tasks.removeAt(index);
  }

  void toggleTaskCompletion (int index){
    tasks[index].status = !tasks[index].status;
  }

  void  editTask( {required int index, required String description, required String title}){
    tasks[index].title = title;
    tasks[index].description = description;
  }

  int taskCompleted(){
       int taskCompletedIndex = 0;
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