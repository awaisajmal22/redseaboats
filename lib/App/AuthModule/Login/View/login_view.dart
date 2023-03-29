import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/FormField/pinCode_formfield.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../Common/FormField/custom_formfield.dart';
import '../../../../RoutesAndBindings/app_routes.dart';
import '../ViewModel/login_view_model.dart';
import '../../../../Common/Divider/divider.dart';
import 'Component/forgetPassword_bottom_sheet.dart';
import 'Component/pincode_bottom_sheet.dart';
import 'Component/resetPassword_bottom_sheet.dart';
import 'Component/third_party_buttons.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final loginVM = Get.find<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 6.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
                text: 'Login',
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
                text: 'Login with your username or email.',
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
                    validator: (value) {},
                    suffixIcon: const Icon(null),
                    controller: loginVM.emailController,
                    hintText: 'Email Address'),
                Container(
                  height: 1,
                  width: SizeConfig.widthMultiplier * 100,
                  color: AppColor.textGrey.withOpacity(0.20),
                ),
                Obx(
                  () => customFormField(
                      obsecureText: loginVM.isObsecure.value,
                      isObsecure: () {
                        loginVM.isObsecure.value = !loginVM.isObsecure.value;
                      },
                      validator: (value) {},
                      suffixIcon: loginVM.isObsecure.value == true
                          ? const Icon(
                              Icons.visibility,
                              color: AppColor.textGrey,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: AppColor.textGrey,
                            ),
                      controller: loginVM.passwordController,
                      hintText: 'Password'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onTap: () {
                  forgetPasswordBottomSheet(
                      submitCallback: () {
                        Get.back();
                        loginVM.startTimer(36);
                        pinCodeBottomSheet(
                            resendCodeCallback: () {
                              print('ok');
                              if (loginVM.time.value == '00:00') {
                                loginVM.timer!.cancel();
                                loginVM.startTimer(36);
                              }
                            },
                            remaningTime: loginVM.time,
                            verifyCallback: () {
                              Get.back();
                              loginVM.timer!.cancel();
                              resetPasswordBottomSheet(
                                  resetCallback: () {
                                    Get.back();
                                  },
                                  obecureText: loginVM.resetPasswordIsObsecure,
                                  hintText: loginVM.resetPasswordHintText,
                                  controller: loginVM.resetPasswordController);
                            },
                            pinController: loginVM.pinControllers,
                            focusNode: loginVM.pinFocusNodes);
                      },
                      controller: loginVM.forgetPasswordEmailController);
                },
                child: appText(
                    text: 'Forgot Password?',
                    textColor: AppColor.textGrey,
                    fontSize: SizeConfig.textMultiplier * 2.0,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          appButton(
              buttonHeight: SizeConfig.heightMultiplier * 6.8,
              butonWidth: SizeConfig.widthMultiplier * 100,
              voidCallback: () {
                Get.offAllNamed(AppRoutes.onBoardingView);
              },
              widget: appText(
                  text: 'Sign In', fontSize: SizeConfig.textMultiplier * 2.0)),
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
                Get.offAndToNamed(AppRoutes.signupView);
              },
              child: appText(
                  text: "Don't have an account? SignUp",
                  textColor: AppColor.textBlack,
                  fontSize: SizeConfig.textMultiplier * 1.75,
                  fontWeight: FontWeight.w500))
        ],
      )),
    );
  }

  
}
