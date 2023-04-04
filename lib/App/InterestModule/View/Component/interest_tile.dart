 import 'package:flutter/material.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';

import '../../../../Common/AppText/appText.dart';
import '../../../../Common/SizeConfig/size_config.dart';

Widget interestTile({
    required VoidCallback voidCallback,
    required String title,
    required String imageUrl,
    required bool check
  }) {
    return GestureDetector(
                onTap: voidCallback,
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 10, top: 11, bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                  ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child:  Image(image: AssetImage(check == false ? 'assets/interest/uncheck.png': 'assets/interest/check.png'),
                      height: SizeConfig.imageSizeMultiplier * 6.0,width: SizeConfig.imageSizeMultiplier * 6.0, ),
                    ),
                    appText(text: title, fontSize: SizeConfig.textMultiplier * 1.75)
                  ],
                 ),
                ),
              );
  }
   Widget shimmerinterestTile() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 10, top: 11, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        // color: AppColor.white
      ),
     child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child:  Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white
            ),
          height: SizeConfig.imageSizeMultiplier * 6.0,width: SizeConfig.imageSizeMultiplier * 6.0, ),
     ),
       Container(
        width: SizeConfig.widthMultiplier * 30,
        height: SizeConfig.heightMultiplier * 1.75,
        decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(8)
                      ),
       )
      ],
     ),
    );
  }