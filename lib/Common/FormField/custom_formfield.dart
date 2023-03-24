 import 'package:flutter/material.dart';

import '../AppColors/app_colors.dart';
import '../SizeConfig/size_config.dart';

Widget customFormField({
  required TextEditingController controller, 
  required String hintText,
  TextInputType keyBoeardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  Icon? suffixIcon,
  bool obsecureText = false,
  VoidCallback? isObsecure,
   Function(String?)? validator,
   int maxLines = 1
  }
  ) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator as String? Function(String?),
      obscureText: obsecureText,
      keyboardType: keyBoeardType,
      textInputAction: textInputAction,
      cursorColor: AppColor.textBlack,
                  controller: controller,
                  style:  TextStyle(
                    color: AppColor.textBlack,
                    fontSize: SizeConfig.textMultiplier * 2.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400
                  ),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: isObsecure,
                      child: suffixIcon
                      ),
                    contentPadding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2.2),
                    hintText: hintText,
                    hintStyle: TextStyle(
                    color: AppColor.textBlack,
                    fontSize: SizeConfig.textMultiplier * 2.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400
                  ),
                    border: InputBorder.none,
                    fillColor: AppColor.whiteFC.withOpacity(0.95),
                    filled: true,
                    errorBorder:InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none
                  ),
                );
  }