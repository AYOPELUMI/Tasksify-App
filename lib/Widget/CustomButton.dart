
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
     this.onPressed,
     required this.backgroundColor,
     required this.iconDetail,
     required this.iconColor});

      final void Function()? onPressed;
      final backgroundColor;
      final Object iconDetail; 
      final Object iconColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const CircleBorder(), 
        padding: const EdgeInsets.all(20)
      ),
      onPressed: onPressed,
      child:  Icon(iconDetail as IconData?, color: iconColor as Color?,),
    );
  }
}