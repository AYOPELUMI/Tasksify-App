import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.title, required this.data});
  final String title,data;

  @override
  Widget build(BuildContext context) {
    return           Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
            boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(-3,0),
                ),
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(3,0),
                ) // no shadow color set, defaults to black
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
            children: [
              Text(title,
              style: TextStyle(
                  color:Colors.black,
                  fontSize:15,
                  fontWeight: FontWeight.bold
                ),),
              Text(data, style: TextStyle(
                  color:Colors.black38,
                  fontSize:15,
                  fontWeight: FontWeight.normal
                ),),

            ],
          )
          );
  }
}