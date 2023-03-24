import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget filterTile({
    required String title,
    required int selectedIndex,
    required VoidCallback voidCallback,
    required int index
  }) {
    return GestureDetector(
              onTap: voidCallback,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                ),
                color: selectedIndex == index ? AppColor.parrotGreen : AppColor.whiteFC,
                elevation: 0,
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                     horizontal: SizeConfig.widthMultiplier * 3.2,
                  vertical: SizeConfig.heightMultiplier * 0.8,
                  ),
                  child: appText(text: title, textColor: selectedIndex == index ? AppColor.white : AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.5, fontWeight: FontWeight.w400),
                ),
                          ),
            );
  }