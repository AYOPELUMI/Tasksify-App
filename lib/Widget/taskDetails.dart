import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/Constants/AppColors.dart';
import 'customTile.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {

    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details")
      ),
      body:Container(
        color: Colors.white,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children:[
          CustomTile(title:"Task Tilte : ", data: data.title),
          SizedBox(height:10),

          CustomTile(title:"Task description : ", data: data.description),
          SizedBox(height:10),
          CustomTile(title:"Task Time of Creation : ", data: data.timeofCreation),
          SizedBox(height:10),
          CustomTile(title:"Task completed status", data: data.status? "true" : "false"),

          SizedBox(height:30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(150, 20),
                    foregroundColor: Colors.red,
                    elevation:10,
                    alignment: Alignment.center,
                    padding:  const EdgeInsets.all(15)
                  ),
              onPressed: (){
              Get.back();
            }, child: Text("Back",
                              style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),))

        ]
    )),
    );
  }
}