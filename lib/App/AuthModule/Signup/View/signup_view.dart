import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:redseaboats/App/AuthModule/Signup/ViewModel/signup_view_model.dart';
import 'package:redseaboats/Common/loadingIndicator.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import '../../../../Common/AppButton/app_button.dart';
import '../../../../Common/AppColors/app_colors.dart';
import '../../../../Common/AppText/appText.dart';
import '../../../../Common/Divider/divider.dart';
import '../../../../Common/FormField/custom_formfield.dart';
import '../../../../Common/SizeConfig/size_config.dart';
import '../../Login/View/Component/third_party_buttons.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final signupVM = Get.find<SignUpViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: signupVM.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5.0),
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 6.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  text: 'Create Account',
                  textColor: AppColor.textBlack,
                  fontSize: SizeConfig.textMultiplier * 4.5,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.75,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  text: 'Create a new account with your email',
                  textColor: AppColor.textGrey,
                  fontSize: SizeConfig.textMultiplier * 2.0,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.5,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5.0),
              // height: SizeConfig.heightMultiplier * 15,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                  color: AppColor.whiteFC.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customFormField(
                      isObsecure: () {},
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Please Enter Your First Name';
                        }
                      },
                      suffixIcon: const Icon(null),
                      controller: signupVM.firstNameController,
                      hintText: 'First Name'),
                  Container(
                    height: 1,
                    width: SizeConfig.widthMultiplier * 100,
                    color: AppColor.textGrey.withOpacity(0.20),
                  ),
                  customFormField(
                      isObsecure: () {},
                      validator: (value) {
                         if(value!.isEmpty){
                          return 'Please Enter Your Last Name';
                        }
                      },
                      suffixIcon: Icon(null),
                      controller: signupVM.lastNameController,
                      hintText: 'Last Name'),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5.0),
              // height: SizeConfig.heightMultiplier * 15,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                  color: AppColor.whiteFC.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customFormField(
                      isObsecure: () {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!signupVM.emailValid.hasMatch(value)) {
                          return 'Please enter the valid email address';
                        }
                      },
                      suffixIcon: const Icon(null),
                      controller: signupVM.emailController,
                      hintText: 'Email Address'),
                  Container(
                    height: 1,
                    width: SizeConfig.widthMultiplier * 100,
                    color: AppColor.textGrey.withOpacity(0.20),
                  ),
                  customFormField(
                      keyBoeardType: TextInputType.phone,
                      isObsecure: () {},
                      validator: (value) {
                         if(value!.isEmpty){
                          return 'Phone Number is required';
                        }
                        else if(value.length < 7){
                          return "Please Enter Valid Phone Number";
                        }
                      },
                      suffixIcon: Icon(null),
                      controller: signupVM.phoneController,
                      hintText: 'Phone Number'),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5.0),
              // height: SizeConfig.heightMultiplier * 15,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                  color: AppColor.whiteFC.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(8)),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customFormField(
                        obsecureText: signupVM.obsecureText.value,
                        isObsecure: () {
                          signupVM.obsecureText.value =
                              !signupVM.obsecureText.value;
                        },
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Password is required';
                          }else if(value.length < 4){
                            return 'Please enter valid Password';
                          }
                        },
                        suffixIcon: signupVM.obsecureText.value == true
                            ? Icon(
                                Icons.visibility,
                                color: AppColor.textGrey,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: AppColor.textGrey,
                              ),
                        controller: signupVM.passwordController,
                        hintText: 'Password'),
                    Container(
                      height: 1,
                      width: SizeConfig.widthMultiplier * 100,
                      color: AppColor.textGrey.withOpacity(0.20),
                    ),
                    customFormField(
                        textInputAction: TextInputAction.done,
                        obsecureText: signupVM.obsecureText2.value,
                        isObsecure: () {
                          signupVM.obsecureText2.value =
                              !signupVM.obsecureText2.value;
                        },
                        validator: (value) {
                          
                          if(signupVM.passwordController.value != signupVM.confirmPasswordController.value){
                            return 'Your Confirm password do not match';
                          }
                        },
                        suffixIcon: signupVM.obsecureText2.value == true
                            ? Icon(
                                Icons.visibility,
                                color: AppColor.textGrey,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: AppColor.textGrey,
                              ),
                        controller: signupVM.confirmPasswordController,
                        hintText: 'Confirm Password'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            appButton(
                buttonHeight: SizeConfig.heightMultiplier * 6.8,
                butonWidth: SizeConfig.widthMultiplier * 100,
                voidCallback: () async {
                  if (signupVM.formKey.currentState!.validate()) {
                    showLoadingIndicator(context: context);
                    bool? result = await signupVM.localSignUp(
                        firstName: signupVM.firstNameController.value.text,
                        lastName: signupVM.lastNameController.value.text,
                        email: signupVM.emailController.value.text,
                        phoneNumber: signupVM.phoneController.value.text,
                        countryCode:
                            signupVM.phoneController.value.text.substring(0, 2),
                        password: signupVM.passwordController.value.text,
                        photoUrl:
                            'https://cdn.pixabay.com/photo/2016/05/05/02/35/sky-1373167__340.jpg');
                            print(result);
                          hideOpenDialog(context: context);
                          if(result == true){
                            Get.offNamed(AppRoutes.onBoardingView);
                          }
                  }
                },
                widget: appText(
                    text: 'Sign Up',
                    fontSize: SizeConfig.textMultiplier * 2.0)),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            orDivider(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            thirdPartyButton(
                title: 'Sign In with Facebook',
                buttonColor: const Color(0xff3A5998),
                icon: FontAwesomeIcons.facebookF,
                voidCallback: () {}),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),
            thirdPartyButton(
                title: 'Sign In with Google',
                buttonColor: AppColor.red,
                icon: FontAwesomeIcons.google,
                voidCallback: () {}),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),
            thirdPartyButton(
                title: 'Sign In with Apple',
                buttonColor: AppColor.textBlack,
                icon: FontAwesomeIcons.apple,
                voidCallback: () {}),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5.7,
            ),
            GestureDetector(
                onTap: () {
                  Get.offAndToNamed(AppRoutes.loginView);
                },
                child: appText(
                    text: "Already have an account? Sign In",
                    textColor: AppColor.textBlack,
                    fontSize: SizeConfig.textMultiplier * 1.75,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.4,
            )
          ],
        ),
      )),
    );
  }
}
