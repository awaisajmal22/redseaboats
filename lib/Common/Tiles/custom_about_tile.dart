import 'package:flutter/material.dart';

import '../AppColors/app_colors.dart';
import '../AppText/appText.dart';
import '../SizeConfig/size_config.dart';

Widget customAboutTile(
    {
      required String title,
      required String description
    }
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(text: title, textAlign: TextAlign.left, textColor: AppColor.parrotGreen, fontSize: SizeConfig.textMultiplier * 2.0,),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2.0,
        ),
        appText(
          maxLines: 100,
          textAlign: TextAlign.left,
          text: description,
        fontSize: SizeConfig.textMultiplier * 1.5,
        textColor: AppColor.textBlack,
        fontWeight: FontWeight.w400
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2.0,
        ),
        

      ],
    );
  }