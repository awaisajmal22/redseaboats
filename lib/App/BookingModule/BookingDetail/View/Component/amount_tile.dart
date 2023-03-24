import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget amountTile(
    {
      required String title,
      required String amount,
      Color titleColor =AppColor.textGrey,
      Color amountColor = AppColor.textBlack,
      FontWeight fontWeight = FontWeight.w500,
      double titleSize = 12
    }
  ) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  appText(text: title, textColor: titleColor, fontSize: titleSize, fontWeight: fontWeight),
                  appText(text: 'AED $amount', textColor: amountColor, fontSize: SizeConfig.textMultiplier * 1.65, fontWeight: fontWeight)
                ],
              );
  }