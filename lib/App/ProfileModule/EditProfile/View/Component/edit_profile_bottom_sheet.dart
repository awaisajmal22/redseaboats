import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

editProfileBottomSheet(
  {
    required List data,
   VoidCallback? fromCamera,
   VoidCallback? fromGallery,
   VoidCallback? delete
  }
){
  Get.bottomSheet(
    barrierColor: AppColor.shadow29.withOpacity(0.15),
    Container(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.8, vertical: SizeConfig.heightMultiplier * 2.4),
      height: SizeConfig.heightMultiplier * 35,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        color: AppColor.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(text: 'Select Profile photo', textColor: AppColor.textBlack,fontSize: SizeConfig.textMultiplier * 2.25, fontWeight: FontWeight.w700),
          const SizedBox(
            height: 32,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(data.length, (index) =>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: (){
                    if(index == 0){
                      fromCamera!();
                    }
                    else if(index == 1){
                      fromGallery!();
                    }else if(index == 2){
                      delete!();
                    }
                  },
                  leading: ImageIcon( AssetImage(data[index].leadingIcon,), 
                 
                  color: AppColor.textBlack,),
                  
                  title: appText(text: data[index].title,textAlign: TextAlign.left, textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.0, fontWeight: FontWeight.w400),
                  ),
                index == data.length - 1 ? const SizedBox() : Container(
                    height: 1,
                    width: SizeConfig.widthMultiplier * 50,
                    color: Colors.grey[100],
                  )
              ],
            )
              ),
          )
        ],
      ),
    )
  );
}