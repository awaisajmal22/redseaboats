 import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget profileTile(
    {
      required String title,
      required VoidCallback voidCallback
      
    }
  ) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
                        alignment: Alignment.center,
                        height: SizeConfig.heightMultiplier * 5.8,
                        width: SizeConfig.widthMultiplier * 100,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.textGrey.withOpacity(0.15),
                              width: 3
                            )
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText(text: title, fontSize: SizeConfig.textMultiplier * 2.0, fontWeight: FontWeight.w500, textColor: AppColor.textBlack), 
                            Image(image: AssetImage('assets/profile/icons/forword.png'), width: SizeConfig.widthMultiplier * 7.4, height:  SizeConfig.heightMultiplier * 3.7,)
                          ],
                        ),
                      ),
    );
  }