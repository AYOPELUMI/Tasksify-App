import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
      super.key,
      required this.text,
      required this.onPressed,
    });
    final String text;
    final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape:RoundedRectangleBorder(),
      padding: EdgeInsets.all(10),
      elevation: 70,
      color: (text == "CANCEL" )? Colors.red : Color(0xFF6C63FF),
      child:  Text(text,style:TextStyle(color :Colors.white))
    );
  }
}