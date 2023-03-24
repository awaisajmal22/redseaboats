 import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget floatingChatButton(

    {
      required VoidCallback voidCallBack,
    }
  ) {
    return GestureDetector(
      onTap: voidCallBack,
      child: Container(
        alignment: Alignment.center,
        height: SizeConfig.heightMultiplier * 5.4,
        width: SizeConfig.widthMultiplier * 10.8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.parrotGreen,
          boxShadow: [
            BoxShadow(
              color: AppColor.parrotGreen.withOpacity(0.2),
              offset: Offset(0, 8),
              blurRadius: 15
            )
          ]
        ),
        child: Icon(Icons.add, color: AppColor.white,),
      ),
    );
  }