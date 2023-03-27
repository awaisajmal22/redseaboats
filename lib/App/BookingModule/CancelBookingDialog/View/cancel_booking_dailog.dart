import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/ViewModel/booking_detail_view_model.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppText/appText.dart';

import '../../../../Common/AppColors/app_colors.dart';
import '../../../../Common/SizeConfig/size_config.dart';
import '../../../../RoutesAndBindings/app_routes.dart';
import 'component/reason_formfield.dart';
import 'component/reasons_tile.dart';

class CancelBookingDailog extends StatelessWidget {
   CancelBookingDailog({super.key});
  final bookingDetailVM = Get.find<BookingDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(0.15),
      body: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 6.5,
              vertical: SizeConfig.heightMultiplier * 2.4
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(16),
            ),
          height: SizeConfig.heightMultiplier  * 72,
          width: SizeConfig.widthMultiplier * 80,
          child: ListView(
            children: [
              appText(text: 'Cancel Booking', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.25),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              appText(
                text: 'Please enter select your reason to for canceling this booking',
                 textColor: AppColor.textGrey, 
                 fontSize: SizeConfig.textMultiplier * 1.65,
                 fontWeight: FontWeight.w400
                 ),
                 SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                 ),
                 Column(
                  children: List.generate(bookingDetailVM.reasonList.length,
                   (index) => Obx(
                     ()=> reasonTile(
                      voidCallback: (){
                          bookingDetailVM.reasonList[index].check.value = !bookingDetailVM.reasonList[index].check.value;
                        },
                        title: bookingDetailVM.reasonList[index].title,
                        check: bookingDetailVM.reasonList[index].check.value
                     ),
                   )),
                 ),
                 reasonFormField(
                  controller: bookingDetailVM.reasonController
                 ),
                 SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                 ),
                 appButton(
                  buttonColor: AppColor.red,
                  butonWidth:  SizeConfig.widthMultiplier * 100,
                  buttonHeight: SizeConfig.heightMultiplier * 6.8,
                  voidCallback: (){
                    Get.offNamed(AppRoutes.navBar);
                  }, 
                  widget: appText(text: 'Cancel Booking', fontSize: SizeConfig.textMultiplier * 2.0)
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  appButton(
                  buttonColor: AppColor.white,
                  butonWidth:  SizeConfig.widthMultiplier * 100,
                  buttonHeight: SizeConfig.heightMultiplier * 6.8,
                  voidCallback: (){
                    Get.back();
                    
                  }, 
                  widget: appText(text: 'Cancel', fontSize: SizeConfig.textMultiplier * 2.0, textColor: AppColor.textBlack)
                  )
            ],
          )
           
          
          )
        )
      )
    );
    
  }

 

  
}