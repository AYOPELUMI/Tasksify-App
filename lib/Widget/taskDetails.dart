import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/Constants/AppColors.dart';

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
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Row(
              crossAxisAlignment: CrossAxisAlignment.end,
               mainAxisSize: MainAxisSize.max,
            children: [
              Text("Task Title :  "),
              Text(data.title),

            ],
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Task description :"),
              Text(data.description),

            ],
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Time of creation :"),
              Text(data.timeofCreation),

            ],
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Task completed :"),
              Text(data.status? "true" : "false"),

            ],
          ),

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