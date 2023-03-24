 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

AppBar singleUserChatAppBar({
    required String title,
    required String status,
    required String imageUrl
  }) {
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back, color: AppColor.textBlack,),
      ),
      backgroundColor: AppColor.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 5.2,
            width: SizeConfig.widthMultiplier * 10.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
            ),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 3.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(text: title, textColor: AppColor.textBlack, fontSize: SizeConfig.heightMultiplier * 2.25, fontWeight: FontWeight.w500),
              appText(text: status, textColor: AppColor.textGrey, fontSize: SizeConfig.heightMultiplier * 1.5, fontWeight: FontWeight.w400),

            ],
          ),
        ],
      ),
    );
  }