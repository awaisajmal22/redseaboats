import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget settingsTile({
    required VoidCallback voidCallback,
    required String title,
  }) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
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
              const Icon(Icons.arrow_forward, color: AppColor.textGrey,)
            ]),
          ),
    );
  }