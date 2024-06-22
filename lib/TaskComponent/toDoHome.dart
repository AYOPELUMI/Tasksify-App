
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/TaskComponent/DialogWidget.dart';
import 'package:task_app/TaskComponent/Task_Widget.dart';
import 'package:task_app/utils/CustomButton.dart';
import 'package:task_app/utils/DateWidget.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {

   final _taskController = TextEditingController();
   final _todoController = TextEditingController();
  bool isButtonSelected = true;
    List taskList =[
      ["task 1","task 1", false],
      ["task 2","task 1", false],
      // ["task 3", false],
      // ["task 4", false],
      // ["task 5", false]
    ];

    void taskCompleted(bool? value,int index){
      setState((){
        taskList[index][2] = !taskList[index][2];
      });
    }
 
    void deleteTask(int index){
      setState((){
        taskList.removeAt(index);
      });
    }
  
    void cancelTask(){
        Navigator.of(context, rootNavigator: true).pop(context);
    }
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
    void saveNewTask(){
      print("save task enables");
      setState((){
        taskList.add([_taskController.text, _todoController.text,false]);
        _todoController.clear();
        _taskController.clear();
        hideMoreOptions();
      });
      // Navigator.pop(context);
      // Navigator.of(context).maybePop();
      Navigator.of(context, rootNavigator: true).pop(context);
      // Navigator.of(context).pop();
    }
    
    void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogWidget(
          taskController: _taskController,
          todoController: _todoController,
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255,3,65,112),
      body:Stack(
        children: <Widget>[Container( 
          padding: EdgeInsets.fromLTRB(10,0,10,60),
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 243, 243, 243),
              
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,),
              child: const Padding(
                padding:  EdgeInsets.fromLTRB(20.0,40,20,20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    DateWidget(),
                    Row(
                      children: [
                        Text("Ayodeji Pelumi",
                          style: TextStyle(
                            color : Colors.black,
                            fontSize:24,
                          )
                        ),
                        Text("👋",
                          style: TextStyle(
                            fontSize:24,
                          ),
                        ),
                        SizedBox(width: 50,),
                        Expanded(
                          flex: 2,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.search),
                        SizedBox(width: 20,),
                        Icon(Icons.notifications_none)]))
                    ],)])
              ),),
            Container(
              child:  Padding(
                padding: EdgeInsets.symmetric(horizontal:5.0, vertical:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                        child: Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,20.0,10,10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                          // padding: EdgeInsets.all(10.0),
                              children: [
                                Text("📦", style: TextStyle(fontSize: 24,),),
                                SizedBox(height: 20,),
                                Text("Task Today", 
                                  style: TextStyle(
                                    color : Colors.grey,
                                    fontSize:18,
                                  ),),
                                const SizedBox(height: 5,),
                                Text("8",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 20,),
                    Expanded(
                        flex: 5,
                        child: Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:Colors.white,
                            ),
                            child: const Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,20.0,10,10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                            // padding: EdgeInsets.all(10.0),
                                  children: [
                                   Text("🙌", 
                                   style: TextStyle(fontSize: 24)),                                    
                                    const SizedBox(height: 20,),
                                    Text("Active Projects",
                                    style: TextStyle(
                                    color : Colors.grey,
                                    fontSize:18,
                                  ),),
                                const SizedBox(height: 5,),
                                Text("8",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black
                                ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        Padding(
          padding: EdgeInsets.fromLTRB(20,5.0,5,0),
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
          flex: 5,
          child: 
            ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index){
          return TaskWidget(
            taskName:taskList[index][0],
            todoName:taskList[index][1],
            taskCompleted:taskList[index][2],
            onChanged: (value) => taskCompleted(value,index),
            onDelete: (value) =>deleteTask(index));
        },
        )
        ),
        ],),
        ),
        Positioned(
          top: isButtonSelected? null : 0, 
          left:isButtonSelected? null :  0,
          bottom: isButtonSelected? 50 : 0,
          right: isButtonSelected? 10 : 0,
        child: isButtonSelected? 
        CustomButton(
          backgroundColor:0xFF6C63FF,
          onPressed: () =>showMoreOptions(),
          iconDetail: Icons.add,
          iconColor: Colors.white,
        )
        : Container(
          padding: const EdgeInsets.fromLTRB(20.0,20,10,50), 
          color: Colors.white.withOpacity(0.9),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Text("Create task",
                  style: TextStyle(fontSize:20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
                  const SizedBox(width:10),
                  CustomButton(
                    backgroundColor:0xFF6C63FF,
                    onPressed: ()=> createNewTask(),
                    iconDetail: Icons.task_alt,
                    iconColor: Colors.white,
                  )
                ]
              ),
              const SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Text("Create Project",
                  style: TextStyle(fontSize:20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
                  const SizedBox(width:10),

                  CustomButton(
                    backgroundColor:0xFF6C63FF,
                    onPressed: ()=> hideMoreOptions(),
                    iconDetail: Icons.description, 
                    iconColor: Color(0xFFFFFFFF),
                  )
                ]
              ),
              const SizedBox(height:20),

              CustomButton(
                    backgroundColor:0xFFFFFFFF,

                onPressed:() => hideMoreOptions(),
                iconDetail : Icons.close,
                iconColor: Colors.black,
              ),
            ],
          ))
        ),
        ]
        )
        );
  }
}