import 'package:get/get.dart';

import '../Screens/welcomeScreen.dart';

class SplashController extends GetxController {
  @override
  void onInit(){
    Future.delayed(Duration(seconds:4), (){
      Get.off(() => WelcomeScreen());
    },);
    super.onInit();
  }
}