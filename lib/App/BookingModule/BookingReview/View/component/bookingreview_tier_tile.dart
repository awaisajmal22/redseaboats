import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget bookingReviewTierTile({
  required String imageUrl,
  required String title,
  required String discount
}){
  return Container(
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
              );
}