import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppColors/app_colors.dart';

AppBar customAppBar2({
  required String title
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
        child: const Icon(Icons.arrow_back, color: AppColor.textBlack,),
      ),
      title:  Text(title, style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColor.textBlack
      ),),
    );
  }