 import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget editProfileFormField({
  required TextEditingController controller, 
  required String hintText,
  TextInputType keyBoeardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next
  }
  ) {
    return TextFormField(
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