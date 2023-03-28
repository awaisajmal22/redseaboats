import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/Seprator/my_seperator.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../RoutesAndBindings/app_routes.dart';
import '../../../BookingModule/BookingDetail/View/Component/ticket_info_card_tile.dart';
import '../../../BookingModule/BookingReview/View/component/date_time_info_tile.dart';
import 'component/after_payment_ticket_tile.dart';

class AfterPaymentView extends StatelessWidget {
  const AfterPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: SizeConfig.heightMultiplier * 10,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 2.0,
            horizontal: SizeConfig.widthMultiplier * 7.0),
        child: appButton(
            buttonHeight: SizeConfig.heightMultiplier * 6.8,
            butonWidth: SizeConfig.widthMultiplier * 100,
            voidCallback: () {
              Get.offNamed(AppRoutes.navBar);
            },
            widget: appText(
                text: 'View Booking Details',
                fontSize: SizeConfig.textMultiplier * 2.0)),
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 3.0,
            horizontal: SizeConfig.widthMultiplier * 5.0),
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 20,
            width: SizeConfig.widthMultiplier * 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColor.parrotGreen),
          ),
          appText(
              text: 'THankyou',
              fontSize: SizeConfig.textMultiplier * 3.0,
              textColor: AppColor.textBlack),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          appText(
              maxLines: 100,
              fontWeight: FontWeight.w400,
              text:
                  "Hey, Thankyou for booking our service, We'll send a confirmation message on your given contact information.",
              fontSize: SizeConfig.textMultiplier * 1.75,
              textColor: AppColor.textGrey),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          appText(
              text: 'Booking Number',
              fontSize: SizeConfig.textMultiplier * 1.75,
              textColor: AppColor.textBlack,
              fontWeight: FontWeight.w400),
          SizedBox(
            height: SizeConfig.heightMultiplier * 0.5,
          ),
          appText(
              text: 'RSB12345678',
              textColor: AppColor.parrotGreen,
              fontSize: SizeConfig.textMultiplier * 3.2),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          Image(
            image: AssetImage('assets/booking/icons/qrcode.png'),
            fit: BoxFit.contain,
            height: SizeConfig.heightMultiplier * 19.5,
            width: SizeConfig.widthMultiplier * 41,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.25,
          ),
          appText(
              maxLines: 100,
              text:
                  "Please show this QR to the vendor when you arrive on the location, You can also take screenshot and the same QR has emailed to you as well",
              textColor: AppColor.textGrey,
              fontSize: SizeConfig.textMultiplier * 1.75,
              fontWeight: FontWeight.w500),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          afterPaymentTicketTile(
              locationName: 'Dubai Water Sports',
              title: 'Dhow Curise',
              imageUrl:
                  'https://cdn.pixabay.com/photo/2019/04/06/05/17/wallpaper-4106667__340.jpg',
              initialRating: 3.0,
              onratingupdate: (value) {},
              totalRating: '2345'),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
                text: 'Service Provided by',
                fontSize: SizeConfig.textMultiplier * 2.24,
                textColor: AppColor.textBlack),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.3,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
                text: 'Dubai Water Sports',
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.textMultiplier * 2.0,
                textColor: AppColor.parrotGreen),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 0.3,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
                fontWeight: FontWeight.w500,
                text: 'Al Seyahi St, Dubai Marina, Dubai',
                fontSize: SizeConfig.textMultiplier * 1.75,
                textColor: AppColor.textGrey),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
                text: 'Date & Time',
                fontSize: SizeConfig.textMultiplier * 2.24,
                textColor: AppColor.textBlack),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dateTimeInfoTile(
                iconUrl: 'assets/booking/icons/calender.png',
                title: '16, October 2021',
              ),
              Container(
                width: 1,
                height: SizeConfig.heightMultiplier * 1.7,
                color: AppColor.textGrey,
              ),
              dateTimeInfoTile(
                  iconUrl: 'assets/booking/icons/clock.png',
                  title: '5:00 PM to 6:00 PM'),
            ],
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          MySeparator(
            color: Colors.black.withOpacity(0.10),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          appText(
              text:
                  'Press this button to get full details of your confirmation',
              textAlign: TextAlign.left,
              fontSize: SizeConfig.textMultiplier * 1.75,
              fontWeight: FontWeight.w400,
              textColor: AppColor.textGrey),
          SizedBox(
            height: SizeConfig.heightMultiplier * 10,
          )
        ],
      )),
    );
  }
}
