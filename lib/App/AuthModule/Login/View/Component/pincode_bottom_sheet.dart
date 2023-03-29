import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/AppButton/app_button.dart';
import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/FormField/pinCode_formfield.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

pinCodeBottomSheet({
  required List<TextEditingController> pinController,
  required List<FocusNode> focusNode,
  required VoidCallback verifyCallback,
  required RxString remaningTime,
  required VoidCallback resendCodeCallback
}){
  Get.bottomSheet(
    isDismissible: false,
    Container(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 5.0,
        vertical: SizeConfig.heightMultiplier * 2.5
      ),
    height: SizeConfig.heightMultiplier * 54,
    width: SizeConfig.widthMultiplier * 100,
    decoration: const BoxDecoration(
      
      color: AppColor.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20)
      )
    ),
    child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(

              height: SizeConfig.heightMultiplier * 0.8,
              width: SizeConfig.widthMultiplier * 35,
              decoration: BoxDecoration(
                color: const Color(0xffC4C4C4),
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
                
                appText(text: 'Enter 4 Digits Code', textAlign: TextAlign.left, textColor: AppColor.textBlack, fontSize:  SizeConfig.textMultiplier * 2.8),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1.0,
                ),
                appText(
                  maxLines: 20,
                  textAlign: TextAlign.left,
                  text: "Please enter the verification code, sent to your email address ***",
                  textColor: AppColor.textGrey,
                  fontSize: SizeConfig.textMultiplier * 1.75,
                  fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       for(int i = 0; i< 4;i++)
                        pinCodeFormField(
                          textInputAction: TextInputAction.done,
                        onchange: (value){
                          if(value!.length == 1 && i< 3){
                            focusNode[i+1].requestFocus();
                          }
                        },
                        focusNode: focusNode[i],
                        isObsecure: (){},
                        validator: (value){},
                       controller: pinController[i], 
                        hintText: 'Email Address'
                    
                ),
                       
                    ],
                  ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                appButton(
                  butonWidth: SizeConfig.widthMultiplier * 100,
                  buttonHeight: SizeConfig.heightMultiplier * 6.8,
                  voidCallback: verifyCallback, 
                  widget: appText(text: 'Verify', fontSize: SizeConfig.textMultiplier * 2.0)),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Obx(
                      ()=> appText(text: remaningTime.value,fontSize: SizeConfig.textMultiplier * 2.24, textColor: AppColor.parrotGreen,
                      fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: resendCodeCallback,
                      child: appText(text: 'Resend Code',fontSize: SizeConfig.textMultiplier * 1.74, textColor: AppColor.textGrey,
                        fontWeight: FontWeight.w500
                        
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
  ));
}