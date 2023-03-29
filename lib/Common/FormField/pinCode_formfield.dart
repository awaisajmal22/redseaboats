import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../AppColors/app_colors.dart';
import '../SizeConfig/size_config.dart';

Widget pinCodeFormField({
  required TextEditingController controller, 
  required String hintText,
  TextInputType keyBoeardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  required Function(String?)? onchange,

  bool obsecureText = false,
  VoidCallback? isObsecure,
   Function(String?)? validator,
  
   required FocusNode focusNode
  }
  ) {
    return Container(
        alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.0, vertical: 0),
                      height: SizeConfig.heightMultiplier * 6.8,
                      width: SizeConfig.widthMultiplier * 13.4,
                      decoration: BoxDecoration(
                      color: AppColor.whiteFC. withOpacity(0.95),
                      borderRadius: BorderRadius.circular(8)
                      ),
      child: TextFormField(
        
        focusNode: focusNode,
        
       textAlign: TextAlign.center,
       onChanged: onchange as String? Function(String?),
        validator: validator as String? Function(String?),
        obscureText: obsecureText,
        keyboardType: keyBoeardType,
        textInputAction: textInputAction,
        cursorColor: AppColor.textBlack,
                    controller: controller,
                    style:  TextStyle(
                      color: AppColor.textBlack,
                      fontSize: SizeConfig.textMultiplier * 3.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700
                    ),
                    decoration: InputDecoration(
                     
                      contentPadding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 0.0),
                      
                     
                      border: InputBorder.none,
                      fillColor: AppColor.whiteFC.withOpacity(0.95),
                      filled: true,
                      errorBorder:InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none
                    ),
                  ),
    );
  }