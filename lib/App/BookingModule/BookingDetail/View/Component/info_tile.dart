import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget infoTile(
    {
      required String iconUrl,
      required String title,
    Color borderColor = AppColor.textGrey,
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: SizeConfig.heightMultiplier * 3.0,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        mainAxisAlignment: MainAxisAlignment.start,
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
      ),
      SizedBox(
        height: SizeConfig.heightMultiplier * 3.0,
      ),
      Container(
        height: 2,
        width: SizeConfig.widthMultiplier * 100,
        color: borderColor.withOpacity(0.15),
      ),
      
    ],
  );
}
