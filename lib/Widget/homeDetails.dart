import 'package:flutter/material.dart';


class HomeDetails extends StatelessWidget {
 final controller;

  const HomeDetails({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
                padding: EdgeInsets.symmetric(horizontal:5.0, vertical:20),
                child: Row(
                mainAxisSize: MainAxisSize.min,

                  children: [
                    Expanded(
                        child: Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,20.0,10,10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
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
                                Text('${controller.tasks.length}',
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
                   
                        child: Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,20.0,10,10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,

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
                                Text('${controller.taskCompleted()}',
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
                    )
    );
  }
}