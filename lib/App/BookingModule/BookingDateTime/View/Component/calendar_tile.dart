
  import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

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