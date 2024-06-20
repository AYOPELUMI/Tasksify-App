import 'package:flutter/material.dart';

class AnimatedToggleSwitch extends StatefulWidget {
  @override
  _AnimatedToggleSwitchState createState() => _AnimatedToggleSwitchState();
}

class _AnimatedToggleSwitchState extends State<AnimatedToggleSwitch> {
  bool isSwitched = false;
    void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }
  @override
  Widget build(BuildContext context) {
        return Switch(
      value: isSwitched,
      onChanged: _toggleSwitch,
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }
}