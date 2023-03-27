 import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget chooseTimeTile({
    required VoidCallback voidCallback,
    required int index,
    required int selectedIndex,
    required String time
  }) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
                  margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 2.0),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 4.0,
                    vertical: SizeConfig.heightMultiplier * 0.8
                  ),
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? AppColor.parrotGreen : AppColor.whiteFC,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: appText(text: time, textColor: selectedIndex == index ? AppColor.white : AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.5, fontWeight: FontWeight.w500),
                ),
    );
  }