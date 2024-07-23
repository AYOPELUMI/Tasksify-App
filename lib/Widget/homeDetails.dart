import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/taskController.dart';

class HomeDetails extends StatelessWidget {
 final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                                Text("Total Tasks", 
                                  style: TextStyle(
                                    color : Colors.grey,
                                    fontSize:18,
                                  ),),
                                const SizedBox(height: 5,),
                                Text('${taskController.tasks.length}',
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
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,20.0,10,10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                            // padding: EdgeInsets.all(10.0),
                                  children: [
                                   Text("🙌", 
                                   style: TextStyle(fontSize: 24)),                                    
                                    const SizedBox(height: 20,),
                                    Text("Task Completed",
                                    style: TextStyle(
                                    color : Colors.grey,
                                    fontSize:18,
                                  ),),
                                const SizedBox(height: 5,),
                                Text('${taskController.taskCompleted()}',
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
                    );
  }
}