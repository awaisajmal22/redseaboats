import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/AuthModule/Signup/Services/signup_services.dart';

class SignUpViewModel extends GetxController{
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool obsecureText = true.obs;
  RxBool obsecureText2 = true.obs;

  final emailValid =  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final formKey = GlobalKey<FormState>();

  Future<bool?> localSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String countryCode,
    required String password,
    required String photoUrl
  }) async {
    bool? isSuccess = await localRegister(
      firstName: firstName, 
      latsName: lastName, 
      email: email, 
      phoneNumber: phoneNumber, 
      countryCode: phoneNumber,
       password: password, 
       photoUrl: photoUrl
       );
       return isSuccess;
  }
}