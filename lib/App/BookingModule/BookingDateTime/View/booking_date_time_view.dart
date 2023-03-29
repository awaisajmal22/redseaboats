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
import 'package:table_calendar/table_calendar.dart';

import '../../../../RoutesAndBindings/app_routes.dart';
import 'Component/bottom_sheet.dart';
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
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 5.0,
            vertical: SizeConfig.heightMultiplier * 4.0),
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  text: 'Choose Date',
                  fontSize: SizeConfig.textMultiplier * 2.25,
                  textColor: AppColor.textBlack)),
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
                        blurRadius: 15)
                  ]),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4,
                  vertical: SizeConfig.heightMultiplier * 2.0),
              // height: SizeConfig.heightMultiplier * 52,
              child: Obx(
                ()=> CalendarTile(
                  nextMonth: bookingDateTimeVM.monthList[bookingDateTimeVM.selectedMonth.value + 1],
                  month: bookingDateTimeVM.monthList[bookingDateTimeVM.selectedMonth.value],
                  onFocusChange: (value){
                     bookingDateTimeVM.getselectedMonth(value!.month.toInt());
                  },
                  dateTimeCallback: (selectedDay, focusedDay) {
                         
                        },
                ),
              )),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  text: 'Choose Time',
                  fontSize: SizeConfig.textMultiplier * 2.25,
                  textColor: AppColor.textBlack)),
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
                      blurRadius: 18)
                ]),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 3),
                itemCount: bookingDateTimeVM.timeList.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => chooseTimeTile(
                        time: bookingDateTimeVM.timeList[index],
                        index: index,
                        selectedIndex:
                            bookingDateTimeVM.selectedTimeIndex.value,
                        voidCallback: () {
                          bookingDateTimeVM.selectedTimeIndex.value = index;
                        }),
                  );
                }),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          appButton(
              butonWidth: SizeConfig.widthMultiplier * 100,
              buttonHeight: SizeConfig.heightMultiplier * 6.8,
              voidCallback: () {
                Get.back();
                bottomSheet(
                    continueCallback: () {
                      Get.toNamed(AppRoutes.bookingReview);
                    },
                    emiratesIdCallback: () {},
                    passportCallback: () {});
              },
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/category/paperplane.png'),
                    height: SizeConfig.heightMultiplier * 3.0,
                    width: SizeConfig.widthMultiplier * 6.0,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3.2,
                  ),
                  appText(
                      text: 'Continue',
                      fontSize: SizeConfig.textMultiplier * 2.0)
                ],
              )),
        ],
      ),
    );
  }

  Widget CalendarTile(
    {
      // ignore: avoid_types_as_parameter_names
      required Function(DateTime?)? onFocusChange,
      required Function(DateTime, DateTime)? dateTimeCallback,
      required String month,
      required String nextMonth
    }
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appText(text: month, textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.0 ,fontWeight: FontWeight.w400),
            appText(text: nextMonth, textColor: AppColor.textGrey, fontSize: SizeConfig.textMultiplier * 1.75 ,fontWeight: FontWeight.w400),
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 1.55,
        ),
        Container(
          width: SizeConfig.widthMultiplier * 100,
          height: 1,
          color: AppColor.textGrey.withOpacity(0.3),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2.0,
        ),

        TableCalendar(
          onPageChanged: onFocusChange as DateTime? Function(DateTime?),
          onDaySelected: dateTimeCallback as DateTime? Function(DateTime, DateTime),
                  daysOfWeekVisible: true,
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: AppColor.red
                    ),
                    weekendStyle: TextStyle(
                      color: AppColor.red
                    )
                  ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.parrotGreen
                      ),
                        todayTextStyle: TextStyle(
                          
                            fontSize: SizeConfig.textMultiplier * 2.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    headerVisible: false,
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(2000),
                    lastDay: DateTime(3000)),
      ],
    );
  }

  dateTime({
    required BuildContext context,
  }) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2600));
  }
}
