import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/routes/routes.dart';

import 'Bindings/bindings.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/welcomeScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      initialBinding: MyBindings(),
      getPages: [
        GetPage(name: Routes.welcomeScreenRoute, page : () => WelcomeScreen()),
        GetPage(name: Routes.loginScreenRoute, page : () => LoginScreen()),
        GetPage(name: Routes.homeScreenRoute, page : () => HomeScreen())

      ],
      home: SplashScreen(),
    );
  }
}