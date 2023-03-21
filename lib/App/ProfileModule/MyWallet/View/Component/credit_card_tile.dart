import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget creditCardTile({
    required String creditCardNumber,
    required String cardLogo,
    required VoidCallback voidCallback,
    required int index, 
    required int selectedIndex,
    required String title
  }) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 1.863),
              height: SizeConfig.heightMultiplier * 10.0,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: selectedIndex == index ? AppColor.parrotGreen : AppColor.whiteFC
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(image:  AssetImage(cardLogo), height: SizeConfig.heightMultiplier * 4.0,width: SizeConfig.widthMultiplier * 11.9,),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 6.0,
                      ),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(text: title, fontSize: SizeConfig.textMultiplier * 1.75, fontWeight: FontWeight.w400, 
                    textColor: selectedIndex == index ? AppColor.white : AppColor.textGrey
                    ),
                    appText(text: creditCardNumber, fontSize: SizeConfig.textMultiplier * 2.0,
                    textColor: selectedIndex == index ? AppColor.white : AppColor.textBlack
                    ),
                    
                  ],
                ),
                    ],
                  ),
                Image(image: selectedIndex == index ? AssetImage('assets/profile/icons/pin.png',) : AssetImage('assets/profile/icons/unpin.png',), width: SizeConfig.widthMultiplier * 5.0, height:  SizeConfig.heightMultiplier * 2.5,)
                ],
              ),
            ),
    );
  }

  