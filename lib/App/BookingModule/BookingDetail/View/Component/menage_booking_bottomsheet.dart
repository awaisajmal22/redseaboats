import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

menageBookingBottomSheet({
  required VoidCallback rescheduleBookingCallback,
  required VoidCallback cancelBookingCallback
}){
  Get.bottomSheet(
    barrierColor: AppColor.transparent,
    BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 6.0,
          vertical: SizeConfig.heightMultiplier * 3.0
        ),
      height: SizeConfig.heightMultiplier * 47,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColor.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appText(text: 'Confirmation', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 3),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          appText(text: 'Do you want to cancel or reschedule your appointment', fontSize: SizeConfig.textMultiplier * 1.75, fontWeight: FontWeight.w500, textColor: AppColor.textGrey),
    
          SizedBox(
            height: SizeConfig.heightMultiplier * 6.3,
          ),
         appButton(
                    buttonHeight: SizeConfig.heightMultiplier * 6.8,
                    butonWidth: SizeConfig.widthMultiplier * 100,
                    buttonColor: AppColor.parrotGreen,
                    voidCallback: rescheduleBookingCallback, 
                  widget: appText(text: 'Reschedule Booking', fontSize: SizeConfig.textMultiplier * 2.0)
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  appButton(
                    buttonHeight: SizeConfig.heightMultiplier * 6.8,
                    butonWidth: SizeConfig.widthMultiplier * 100,
                    buttonColor: AppColor.red,
                    voidCallback: cancelBookingCallback, 
                  widget: appText(text: 'Cancel Booking', fontSize: SizeConfig.textMultiplier * 2.0)
                  ),
        ],
      ),
      ),
    ));
}