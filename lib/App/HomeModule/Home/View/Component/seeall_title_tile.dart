import 'package:flutter/material.dart';
import 'package:redseaboats/App/HomeModule/Home/View/Component/title_tile.dart';

import '../../../../../../Common/AppColors/app_colors.dart';
import '../../../../../../Common/AppText/appText.dart';
import '../../../../../../Common/SizeConfig/size_config.dart';

Widget seeAllTitleTile({
    required VoidCallback seeAllCallBack,
    required String title
  }) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleTile(title: title,),
            GestureDetector(
              onTap: seeAllCallBack,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  appText(text: 'SeeAll', textColor: AppColor.textGrey, fontSize: 12, fontWeight: FontWeight.w400),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 1.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.parrotGreen
                    ),
                    child: Icon(Icons.keyboard_arrow_right, color: AppColor.white, size: 8,),
                  )
                ],
              ),
            )
          ],
        );
  }