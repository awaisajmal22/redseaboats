import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget dateTimeInfoTile(
    {
      required String iconUrl,
      required String title
    }
  ) {
    return Row(
                    children: [
                       ImageIcon(
          AssetImage(iconUrl),
          color: AppColor.parrotGreen,
          size: SizeConfig.imageSizeMultiplier * 5,
        ),
        SizedBox(
          width: SizeConfig.widthMultiplier * 2.0,
        ),
        appText(
            text: title,
            fontSize: SizeConfig.textMultiplier * 1.5,
            textColor: AppColor.textBlack,
            fontWeight: FontWeight.w500),
                    ],
                  );
  }