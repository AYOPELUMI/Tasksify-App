import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          padding:const EdgeInsets.fromLTRB(10.0,50.0,10.0,30.0),
            decoration: BoxDecoration(
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
                      color: Colors.blue,
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
                  Text("Manage all your projects and tasks in one place",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(350, 20)),
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    elevation: WidgetStateProperty.all<double>(70),
                    alignment: Alignment.center,
                    padding: WidgetStateProperty.all<EdgeInsets>( EdgeInsets.all(20))
                  ),
                  child: Text("Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                  ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Do you have an account?",
                    style:TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
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