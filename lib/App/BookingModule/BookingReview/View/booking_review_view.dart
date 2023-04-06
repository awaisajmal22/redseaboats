import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/View/Component/amount_tile.dart';
import 'package:redseaboats/App/BookingModule/BookingReview/View/component/bookingreview_tier_tile.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/Seprator/my_seperator.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../RoutesAndBindings/app_routes.dart';
import '../../BookingDetail/View/Component/info_tile.dart';
import 'component/date_time_info_tile.dart';
import 'component/membership_discount_tile.dart';
import 'component/review_info_card_tile.dart';

class BookingReviewView extends StatelessWidget {
   BookingReviewView({super.key});
  var data = Get.arguments[0];
  var selectedTime = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Booking Review'),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5.0,
          vertical: SizeConfig.heightMultiplier * 3.0
        ),
        children: [
          reviewInfoCardTile(
                time: '10:00 AM - 10:00 PM',
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
                  child: appText(text: 'Date & Time', fontSize: SizeConfig.textMultiplier * 2.25, textColor: AppColor.textBlack),
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
                title: selectedTime.toString()
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                MySeparator(
                  color: Colors.black.withOpacity(0.10),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: appText(text: 'Contact Information', fontSize: SizeConfig.textMultiplier * 2.25, textColor: AppColor.textBlack),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                ),
                 infoTile(
                iconUrl: 'assets/booking/icons/sms.png',
                title: 'data.location.email'),
            infoTile(
                iconUrl: 'assets/booking/icons/call.png',
                title: '+97463727273743',
                borderColor: AppColor.white),
                MySeparator(
                  color: Colors.black.withOpacity(0.10),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: AssetImage('assets/booking/icons/voucher.png'), height: SizeConfig.heightMultiplier * 1.5, width: SizeConfig.widthMultiplier * 2.4,),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 2.0,
                    ),
                    appText(text: 'Apply Voucher Code', textColor: AppColor.parrotGreen, fontSize: SizeConfig.textMultiplier * 1.5, fontWeight: FontWeight.w500)
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                bookingReviewTierTile(
                  imageUrl: 'assets/membership/silver.png', 
                  title: 'Silver', discount: '15'),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3.0,
                  ),
                  amountTile(title: 'Activity Price', amount: '620.00'),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  memberShipDiscountTile(
                    iconUrl: 'assets/membership/silver.png',
                    title: 'Membership Discount',
                    amount: '0'
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  amountTile(title: 'Discount Voucher', amount: '200.00'),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  amountTile(title: 'Taxes & Services Fees', amount: '30.00'),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  Container(
                    width: SizeConfig.widthMultiplier * 100,
                    height: 1,
                    color: AppColor.textGrey.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  amountTile(
                title: 'Total Amount',
                amount: '450.00',
                titleColor: AppColor.textBlack,
                amountColor: AppColor.parrotGreen,
                titleSize: 13,
                fontWeight: FontWeight.w700),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                 appButton(
              butonWidth: SizeConfig.widthMultiplier * 100,
              buttonHeight: SizeConfig.heightMultiplier * 6.8,
              voidCallback: (){
                Get.toNamed(AppRoutes.paymentMethodView);
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

  
  
}