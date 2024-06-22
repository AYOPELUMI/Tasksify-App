// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding:const EdgeInsets.fromLTRB(10.0,50.0,10.0,30.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/home_image.png',
                  height: 300,
                  width: 400,
                  fit: BoxFit.contain,),
                 Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Welcome to Tasksify!",
                    style:TextStyle(
                      color: Color(0xFF6C63FF),
                      fontSize: 34,
                      fontWeight: FontWeight.bold)),
                   TextSpan(text: "\nCreate a task today",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold)),
                  ]
                ),
                ),
                  const Text("Manage all your projects and tasks in one place",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: (){
                     Navigator.pushNamed(context, '/login');
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(const Size(350, 20)),
                    backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF6C63FF)),
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    elevation: WidgetStateProperty.all<double>(70),
                    alignment: Alignment.center,
                    padding: WidgetStateProperty.all<EdgeInsets>( const EdgeInsets.all(20))
                  ),
                  child: const Text("Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                  ),
              const Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Do you have an account?",
                    style:TextStyle(
                      color: Colors.black38,
                      fontSize: 14,),),
                   TextSpan(text: "Log in",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
                  ]
                ),
                )
                
              ],)
        )
        );
  }
}