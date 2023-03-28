import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget memberShipDiscountTile({
    required String iconUrl,
    required String amount,
    required String title,
    Color amountColor = AppColor.textBlack,
    FontWeight fontWeight = FontWeight.w500
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        appText(text: title, textColor: AppColor.textGrey, fontSize: 12),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 2.0,
                        ),
                         Image(
         image: AssetImage(iconUrl),
          height: SizeConfig.imageSizeMultiplier * 5,
        ),

                      ],
                    ),
                    appText(text: 'AED $amount', textColor: amountColor, fontSize: SizeConfig.textMultiplier * 1.65, fontWeight: fontWeight)
                  ],
                );
  }
