import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../utils/Constants/AppColors.dart';

class HomeFloatingButtons extends StatelessWidget {

  const HomeFloatingButtons({super.key, required this.addTask, required this.isButtonSelected, required this.showMoreOptions, required this.hideMoreOptions, });
  final void Function()  addTask;
  final void Function()  showMoreOptions;
  final void Function()  hideMoreOptions;
  final bool isButtonSelected;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          spaceBetweenChildren: 4,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          visible: true, 
           childPadding: const EdgeInsets.all(1),
          curve: Curves.bounceInOut,
           shape:StadiumBorder(),
          children: [
                // FAB 1
                SpeedDialChild(
                child:const Icon(Icons.description, color: Colors.white),
                backgroundColor: primaryColor,
                onTap: ()=> hideMoreOptions(),
                shape:StadiumBorder(),
                label: 'Create projects',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    ),
                labelBackgroundColor: Colors.white),
                // FAB 2
                SpeedDialChild(
                child: Icon(Icons.task_alt_rounded, color: Colors.white),
                backgroundColor: primaryColor,
                shape:StadiumBorder(),
                onTap:()=> addTask(),
                label: 'Create task',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16.0),
                labelBackgroundColor: Colors.white)
          ],
        );}
}