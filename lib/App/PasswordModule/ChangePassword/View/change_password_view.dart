import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/PasswordModule/ChangePassword/ViewModel/change_password_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/FormField/custom_formfield.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../Common/AppButton/app_button.dart';
import '../../../../Common/AppText/appText.dart';

class ChangePasswordView extends StatelessWidget {
   ChangePasswordView({super.key});
   final changePasswordVM = ChangePasswordViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(1),
      appBar: customAppBar2(title: 'Change Password'),
      body: Form(
        key: changePasswordVM.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 4.0),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.whiteFC.withOpacity(0.95)
              ),
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0,),
              child: Obx(
                ()=> customFormField(
                  validator: (value){},

                  controller: changePasswordVM.oldPasswordController, 
                  hintText: 'Old Password', 
                  obsecureText: changePasswordVM.isObsecure1.value,
                  isObsecure: (){
                    changePasswordVM.isObsecure1.value = !changePasswordVM.isObsecure1.value;
                  },
                suffixIcon: const Icon(FontAwesomeIcons.question, size: 16, color: AppColor.textGrey,)
                ),
              )),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              Container(
                alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              // height: SizeConfig.heightMultiplier * 15,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
              color: AppColor.whiteFC. withOpacity(0.95),
              borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    ()=> customFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please Enter Your New Password';
                    }
                  },

                      obsecureText: changePasswordVM.isObsecure2.value,
                      isObsecure: (){
                        changePasswordVM.isObsecure2.value = !changePasswordVM.isObsecure2.value;
                      },
                      suffixIcon: const Icon(FontAwesomeIcons.question, size: 16, color: AppColor.textGrey,),
                     controller: changePasswordVM.newPasswordController, 
                      hintText: 'New Password'
                      ),
                  ),
                  Container(
                    height: 1,
                    width: SizeConfig.widthMultiplier * 100,
                    color: AppColor.textGrey.withOpacity(0.20),
                  ),
                  Obx(
                   ()=> customFormField(
                  validator: (value){
                    if(changePasswordVM.confirmPasswordController != changePasswordVM.newPasswordController){
                      return 'Your Password do not match';
                    }
                  },
                      obsecureText: changePasswordVM.isObsecure3.value,
                      isObsecure: (){
                        changePasswordVM.isObsecure3.value = !changePasswordVM.isObsecure3.value;
                      },
                      suffixIcon: const Icon(FontAwesomeIcons.question, size: 16, color: AppColor.textGrey,),
                     controller: changePasswordVM.confirmPasswordController,
                     hintText:  'Re-Enter Password',
                     textInputAction: TextInputAction.done
                     ),
                  ),
                   
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1.4),
            child: appButton(
              radius: 6,
              voidCallback: (){
                if(changePasswordVM.formKey.currentState!.validate()){
                  print('success');
                }
                else {
                  print('error');
                }
              }, 
              widget: appText(text: 'Update Password',
               fontSize: SizeConfig.textMultiplier * 2.0), 
               butonWidth: SizeConfig.widthMultiplier * 100,
               buttonHeight: SizeConfig.heightMultiplier * 6.8
               ),
               
               
          )
          ],
        ),
      ),
    );
  }
}