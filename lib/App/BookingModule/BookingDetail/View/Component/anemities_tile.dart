import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget anemitiesTile({
    required String imageUrl,
    required String name
  }) {
    return Row(
      children: [
        Column(
                      children: [
                        Image(image: AssetImage(imageUrl),
                      height: SizeConfig.heightMultiplier * 5.6,
                      width: SizeConfig.widthMultiplier * 11.2,
                        ),
                        appText(text: name, fontWeight: FontWeight.w500, textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.3)
                      ],
                    ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 4.0,
                  )
      ],
    );
  }