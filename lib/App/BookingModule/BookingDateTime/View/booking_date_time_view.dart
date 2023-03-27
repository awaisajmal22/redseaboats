import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/BookingModule/BookingDateTime/ViewModel/booking_date_time_view_model.dart';
import 'package:redseaboats/App/HomeModule/Home/ViewModel/home_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../RoutesAndBindings/app_routes.dart';
import 'Component/choose_time_tile.dart';

class BookingDateTimeView extends StatelessWidget {
  BookingDateTimeView({super.key});
 final bookingDateTimeVM = Get.find<BookingDateTimeViewModel>();
 final homeVM = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Booking Date Time'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 4.0),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: appText(text: 'Choose Date', fontSize: SizeConfig.textMultiplier * 2.25, textColor: AppColor.textBlack)),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
           Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor1A.withOpacity(0.15),
                  offset: const Offset(0, 8),
                  blurRadius: 15
                )
              ]
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 4,
              vertical: SizeConfig.heightMultiplier * 2.0
            ),
            height: SizeConfig.heightMultiplier * 40,
           child: CalendarDatePicker(
            
          initialCalendarMode: DatePickerMode.day,
            initialDate: DateTime.now(),
             firstDate: DateTime(1950), 
             lastDate: DateTime(2600), 
             onDateChanged: (value){}
             ),
           ),
           SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
           ),
           Align(
            alignment: Alignment.centerLeft,
            child: appText(text: 'Choose Time', fontSize: SizeConfig.textMultiplier * 2.25, textColor: AppColor.textBlack)),
            SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
           ),
           Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.heightMultiplier * 1.6,
            ),
            height: SizeConfig.heightMultiplier * 8.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor1A.withOpacity(0.1),
                  offset: const Offset(0, 8),
                  blurRadius: 18
                )
              ]
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 3),
            itemCount: bookingDateTimeVM.timeList.length,
              itemBuilder: (context, index){
                return Obx(
                 ()=> chooseTimeTile(
                  time: bookingDateTimeVM.timeList[index],
                    index: index,
                    selectedIndex: bookingDateTimeVM.selectedTimeIndex.value,
                    voidCallback: (){
                      bookingDateTimeVM.selectedTimeIndex.value = index;
                    }
                  ),
                );
            }),
           ),
           SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
           ),
           appButton(
          butonWidth: SizeConfig.widthMultiplier * 100,
          buttonHeight: SizeConfig.heightMultiplier * 6.8,
          voidCallback: (){
            
            Get.bottomSheet(
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0
                ),
                child: Container(
                  height: SizeConfig.heightMultiplier * 50,
                  color: AppColor.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
                      child: appText(text: 'Additional Information',fontSize: SizeConfig.textMultiplier * 3.0),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 5.0,
                          right: SizeConfig.widthMultiplier * 5.0,
                          top: SizeConfig.heightMultiplier * 3.5
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                          ),
                          color: AppColor.white
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                appText(text: 'Update Security Document', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.0),
                                GestureDetector(
                                  onTap: (){},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      appText(text: 'Skip', fontSize: SizeConfig.textMultiplier * 1.5, textColor: AppColor.textGrey, fontWeight: FontWeight.w500),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 2.0,
                                      ),
                                      Icon(Icons.arrow_forward_rounded, color: AppColor.textGrey, size: SizeConfig.imageSizeMultiplier * 4.3,)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              )
            );
          },
           widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: const AssetImage('assets/category/paperplane.png'), height: SizeConfig.heightMultiplier * 3.0,
              width: SizeConfig.widthMultiplier * 6.0,),
              SizedBox(
                width: SizeConfig.widthMultiplier * 3.2,
              ),
              appText(text: 'Continue', fontSize: SizeConfig.textMultiplier * 2.0)
            ],
          )),
        ],
      ),
    );
  }

 
}