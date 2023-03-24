import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget switchTile({
  required Function(bool?)? onChanged,
    required String title,
    required bool value,
    Color activeColor = AppColor.parrotGreen
  }) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0 , vertical: SizeConfig.heightMultiplier * 2.0),
          height: SizeConfig.heightMultiplier * 7.6,
          width: SizeConfig.widthMultiplier * 100,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff00000D).withOpacity(0.05),
                offset: const Offset(0, 8),
                blurRadius: 32
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            appText(text: title, fontSize: SizeConfig.textMultiplier * 1.75, textColor: AppColor.textBlack),
             Transform.scale(
              scale: 0.6,
               child: CupertinoSwitch(
                  activeColor: activeColor,
                  value: value, 
                  onChanged: onChanged as bool? Function(bool?)
                ),
             ),
            
          ]),
        );
  }
 