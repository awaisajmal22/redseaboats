import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/Component/pincode_bottom_sheet.dart';

class LoginViewModel extends GetxController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPasswordEmailController = TextEditingController();
  RxBool isObsecure = true.obs;
  List<FocusNode> pinFocusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> pinControllers = List.generate(4, (index) => TextEditingController());
  List<TextEditingController> resetPasswordController = List.generate(2, (index) => TextEditingController());
  List<RxBool> resetPasswordIsObsecure = List.generate(2, (index) => true.obs);
  List resetPasswordHintText = [
    'New Password',
    'Confirm Password'
  ];

   Timer? timer;
  int remainingSeconds = 0;
  final time = '00:00'.obs;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pinCodeBottomSheet;
  }
  @override
  void onClose() {

   
    for(int i = 0; i < 4; i++){
      pinFocusNodes[i].dispose();
    }
    super.onClose();
     if (timer != null) {
      timer!.cancel();
    }
  }

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds < 0) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2,'0')}";
        remainingSeconds--;
      }
    });
  }
}