import 'package:flutter/material.dart';

import '../../../../../../Common/AppColors/app_colors.dart';
import '../../../../../../Common/AppText/appText.dart';
import '../../../../../../Common/SizeConfig/size_config.dart';

Widget categoryTile({
  required int index,
  required int length,
    required String imageUrl,
    required String title,
    required VoidCallback categoriesCallBack
  }) {
    return GestureDetector(
      onTap: categoriesCallBack,
      child: Container(
                  margin: EdgeInsets.symmetric(horizontal: index == length - 1 ? 0 : SizeConfig.widthMultiplier * 2.6),
                  height: SizeConfig.heightMultiplier * 11.12,
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.heightMultiplier * 8.0,
                        width: SizeConfig.widthMultiplier * 16.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.0,
                      ),
                      appText(text: title,fontSize:  SizeConfig.textMultiplier * 1.4, textColor: AppColor.textBlack)
                    ],
                  ),
                ),
    );
  }

  
