import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget avalaibleBalanceTile({
    required String avalaibleBalance
  }) {
    return DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(8,),
            color: AppColor.parrotGreen,
            dashPattern: [
            6
            ],
            strokeWidth: 2,
            strokeCap: StrokeCap.square,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 2.0),
              height: SizeConfig.heightMultiplier * 13.5,
              width: SizeConfig.widthMultiplier * 100,
             decoration: BoxDecoration(
              color: const Color(0xff186B6D).withOpacity(0.07),
              borderRadius: BorderRadius.circular(8)
             ),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText(text: 'Available Balance', fontSize: SizeConfig.textMultiplier * 1.75, fontWeight: FontWeight.w400, textColor: AppColor.textGrey),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.8,
                    ),
                    appText(text: 'AED $avalaibleBalance', fontSize: SizeConfig.textMultiplier * 3.75, textColor: AppColor.textBlack)
                  ],
                ),
                Row(
                  children: [
                    ImageIcon(AssetImage('assets/profile/icons/add.png'), size: SizeConfig.imageSizeMultiplier * 5.6, color: AppColor.parrotGreen,),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 2.0,
                    ),
                    appText(text: 'Top up', fontSize: SizeConfig.textMultiplier * 1.75, textColor: AppColor.parrotGreen,)
                  ],
                ),
                
              ],
             ),
            ),
          );
  }