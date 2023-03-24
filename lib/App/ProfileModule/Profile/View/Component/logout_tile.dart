import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget logOutTile(
    {
      required String title,
      required VoidCallback voidCallback
      
    }
  ) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
                        alignment: Alignment.centerLeft,
                        height: SizeConfig.heightMultiplier * 5.8,
                        width: SizeConfig.widthMultiplier * 100,
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            appText(text: title, fontSize: SizeConfig.textMultiplier * 2.0, fontWeight: FontWeight.w500, textColor: AppColor.textBlack),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 2.4,
                            ) ,
                            Icon(FontAwesomeIcons.arrowRightFromBracket, color: AppColor.parrotGreen, size: SizeConfig.imageSizeMultiplier * 4.0,)
                          ],
                        ),
                      ),
    );
  }