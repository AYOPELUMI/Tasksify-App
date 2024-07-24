import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/Controller/loginController.dart';

import 'DateWidget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context) {
          
    return GetBuilder<LoginController>(
          init: Get.find<LoginController>(),
          builder: (controller) => Container( 
          padding: EdgeInsets.fromLTRB(10,0,10,0),
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 243, 243, 243),
              
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              padding:  EdgeInsets.fromLTRB(20.0,40,20,20),
              decoration: BoxDecoration(
                color: Colors.white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children:[
                    DateWidget(),
                    Row(
                      children: [
                        Text("Hello  " + controller.nameController.text,
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
                              Icon(Icons.notifications_none)
                            ]
                          )
                        )
                    ]
                    ),
                    ]
                    )
        )]
        )
    ));
  }
}