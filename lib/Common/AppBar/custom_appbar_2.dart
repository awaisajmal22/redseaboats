import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppColors/app_colors.dart';

AppBar customAppBar2({
  required String title,
  Color titleColor = AppColor.textBlack,
  }
) {
    return AppBar(
      backgroundColor: AppColor.transparent,
      elevation: 0,
      
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child:  Icon(Icons.arrow_back, color: titleColor),
      ),
      title:  Text(title, 
      style:  TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: titleColor
      ),),
    );
  }