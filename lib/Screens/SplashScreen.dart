import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/splashController.dart';
import '../utils/Constants/AppColors.dart';
import '../utils/Constants/Image.dart';
import '../utils/Constants/Name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return  Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.appImage),
            Text(AppText.appName,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: primaryColor
            ),
            )
          ],
        )
      )
    );
  }
}