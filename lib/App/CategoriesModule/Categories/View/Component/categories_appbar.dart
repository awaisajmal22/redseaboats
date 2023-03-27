import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../../Common/AppColors/app_colors.dart';

AppBar categoriesAppBar({
  required String title,
  Color titleColor = AppColor.textBlack,
  required VoidCallback filterCallback
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
      actions: [
        GestureDetector(
          onTap: filterCallback,
          child: Image(image: AssetImage('assets/home/icons/slider.png'),
          width: 16,
          height: 13,
          ),
        ),
        SizedBox(
          width: SizeConfig.widthMultiplier * 5.0,
        )
      ],
    );
  }