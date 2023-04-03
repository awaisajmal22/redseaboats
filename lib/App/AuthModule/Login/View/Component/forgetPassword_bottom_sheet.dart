import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/AppButton/app_button.dart';
import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/FormField/custom_formfield.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

forgetPasswordBottomSheet({
  required TextEditingController controller,
  required VoidCallback submitCallback,
  required dynamic emailValid,
  required GlobalKey<FormState> formKey
}) {
  
    Get.bottomSheet(
      Container(
      height: SizeConfig.heightMultiplier * 45.6,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 5.0,
        vertical: SizeConfig.heightMultiplier * 2.5
      ),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: SizeConfig.heightMultiplier * 0.8,
                width: SizeConfig.widthMultiplier * 35,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  borderRadius: BorderRadius.circular(6)
                ),
              ),
            ),
            
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3.0,
                  ),
            Expanded(
              child: ListView(
                children: [
                  
                  appText(text: 'Forgot Password', textAlign: TextAlign.left, textColor: AppColor.textBlack, fontSize:  SizeConfig.textMultiplier * 2.8),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.0,
                  ),
                  appText(
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    text: "Enter your email for the verification proccesss, we will send 4 digits code to your email.",
                    textColor: AppColor.textGrey,
                    fontSize: SizeConfig.textMultiplier * 1.75,
                    fontWeight: FontWeight.w400
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4.0,
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
                    child: customFormField(
                      textInputAction: TextInputAction.done,
                      isObsecure: (){},
                      validator: (value){
                            if(value!.isEmpty){
                              return "Email is Required";
                            } else if(!emailValid.hasMatch(controller.text)){
                              return "Please enter valid Email";
                            }
                          },
                      suffixIcon: Icon(null),
                     controller: controller, 
                      hintText: 'Email Address'
                      ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3.0,
                  ),
                  appButton(
                    butonWidth: SizeConfig.widthMultiplier * 100,
                    buttonHeight: SizeConfig.heightMultiplier * 6.8,
                    voidCallback: submitCallback, 
                    widget: appText(text: 'Submit', fontSize: SizeConfig.textMultiplier * 2.0))
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }