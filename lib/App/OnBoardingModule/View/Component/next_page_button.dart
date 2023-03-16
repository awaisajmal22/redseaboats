import 'package:flutter/material.dart';

import '../../../../Common/AppColors/app_colors.dart';
import '../../../../Common/SizeConfig/size_config.dart';

Widget nextpageButton(
  {
    required VoidCallback voidCallback,
    
    double radius = 6,
    Color buttonColor = AppColor.parrotGreen,
    required Widget widget,
    Alignment buttonWidgetAlignment = Alignment.center

  }
){
  return GestureDetector(
    onTap: voidCallback,
    child: AnimatedContainer(
   height: SizeConfig.heightMultiplier * 4.5,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
      alignment: buttonWidgetAlignment,
     padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: widget,
    ),
  );
}