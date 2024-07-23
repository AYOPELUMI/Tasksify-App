import 'package:get/get.dart';

import '../Controller/loginController.dart';
import '../Controller/splashController.dart';
import '../Controller/taskController.dart';

class MyBindings implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => TaskController());
  }
}