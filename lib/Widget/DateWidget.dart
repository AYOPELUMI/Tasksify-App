import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});


  @override
  Widget build(BuildContext context) {
     final now = new DateTime.now();
 String formatter =DateFormat.yMMMMd('en_US') .format(now);

    return Text(formatter,style: TextStyle(
      fontSize:14,
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),);
  }
}