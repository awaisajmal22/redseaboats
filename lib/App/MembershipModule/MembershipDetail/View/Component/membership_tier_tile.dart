import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget membershipTierTile(
    {
      required VoidCallback voidCallback,
      required bool check,
      required String subtitile,
      required String title,
      required String discount,
      required String description,
      required String imageUrl
    }
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: voidCallback,
          child: Container(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 2.0),
                height: SizeConfig.heightMultiplier * 10.6,
                width: SizeConfig.widthMultiplier * 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff7B7B7B).withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 8)
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Image(image: AssetImage(imageUrl), fit: BoxFit.cover,),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 3.8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText(text: '$title Member', fontSize: SizeConfig.textMultiplier * 2.0, textColor: AppColor.textBlack, fontWeight: FontWeight.w500),
                        appText(text: '$discount% discount on all services', fontSize: SizeConfig.textMultiplier * 1.5, textColor: AppColor.textGrey, fontWeight: FontWeight.w400),
                      ],
                    )
                    ],
                   ),
                   SizedBox(
                    width: SizeConfig.widthMultiplier* 5.2,
                   ),
                   Image(image: AssetImage( check == false ? 'assets/profile/icons/forword.png' : 'assets/membership/arrow.png' ), height: 22, width:  22, fit: BoxFit.cover,)
                  ],
                ),
              ),
        ),
          check == false ? const SizedBox.shrink() :  AnimatedContainer(
              width: SizeConfig.widthMultiplier * 100,
            
              margin: EdgeInsets.symmetric(horizontal:  SizeConfig.widthMultiplier * 5.0),
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3.2, vertical: SizeConfig.heightMultiplier * 2.0),
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                color: AppColor.whiteFC,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText(text: subtitile,textAlign: TextAlign.left, textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.75),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 0.9,
                  ),
                  appText(
                    textAlign: TextAlign.left,
                    text: description,
                    fontSize: SizeConfig.textMultiplier * 1.6,
            fontWeight: FontWeight.w400,
            textColor: AppColor.textGrey
                  ),
                  
                ],
              ),
            ),
            SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  )
      ],
    );
  }