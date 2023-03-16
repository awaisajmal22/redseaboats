import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashViewModel extends GetxController {

  RxBool animate = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     
    delay();
    
  }
Future delay() async {
Future.delayed(const Duration(seconds: 3), (){
  animate.value = true;
});
}
  
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
