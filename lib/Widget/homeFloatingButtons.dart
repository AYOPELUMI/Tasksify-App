import 'package:flutter/material.dart';

import 'CustomButton.dart';

class HomeFloatingButtons extends StatelessWidget {

  const HomeFloatingButtons({super.key, required this.addTask, required this.isButtonSelected, required this.showMoreOptions, required this.hideMoreOptions, });
  final void Function()  addTask;
  final void Function()  showMoreOptions;
  final void Function()  hideMoreOptions;
  final bool isButtonSelected;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {  },
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
                    onPressed: ()=> addTask(),
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
        );
  }
}