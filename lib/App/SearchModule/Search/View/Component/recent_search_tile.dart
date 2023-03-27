import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget recentSearchTile(
    {
      required VoidCallback removeCallback,
      required String title
    }
  ) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
            
        ),
        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
              FontAwesomeIcons.clock, color: AppColor.textGrey,
              size: SizeConfig.imageSizeMultiplier * 3.2,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 3.0,
            ),
            appText(
              text: title,
             fontSize: SizeConfig.textMultiplier * 1.75, 
             fontWeight: FontWeight.w500,
             textAlign: TextAlign.left, 
             textColor: AppColor.textBlack)
              ],
            ),
            GestureDetector(
              onTap: removeCallback,
              child: Icon(Icons.close, size: SizeConfig.imageSizeMultiplier * 3.2, color: AppColor.textGrey,))
            
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2.0,
        ),
        Container(
          height: 1,
          width: SizeConfig.widthMultiplier * 100,
          color: AppColor.textGrey.withOpacity(0.3),
        )
      ],
    );
  }
