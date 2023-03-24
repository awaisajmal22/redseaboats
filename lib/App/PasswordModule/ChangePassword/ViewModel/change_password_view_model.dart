import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordViewModel extends GetxController{
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxBool isObsecure1 = true.obs;
  RxBool isObsecure2 = true.obs;
  RxBool isObsecure3 = true.obs;
  final formKey = GlobalKey<FormState>();

}