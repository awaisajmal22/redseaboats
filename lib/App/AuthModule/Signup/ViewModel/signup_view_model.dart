import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController{
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool obsecureText = true.obs;
  RxBool obsecureText2 = true.obs;
}