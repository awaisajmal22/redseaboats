import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redseaboats/App/BookingModule/CancelBookingDialog/View/cancel_booking_dailog.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/View/Component/menage_booking_bottomsheet.dart';
import 'package:redseaboats/Common/Seprator/my_seperator.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/View/Component/ticket_info_card_tile.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/ViewModel/booking_detail_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../RoutesAndBindings/app_routes.dart';
import 'Component/amount_tile.dart';
import 'Component/anemities_tile.dart';
import 'Component/info_tile.dart';
import 'Component/location_tile.dart';

class BookingDetailView extends StatelessWidget {
  BookingDetailView({super.key});
  final bookingDetailVM = Get.find<BookingDetailViewModel>();
  var check = Get.arguments[0];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar2(title: 'Booking Detail'),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5.0,
              vertical: SizeConfig.heightMultiplier * 3.9),
          children: [
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
                    'Please show this QR to the vendor when you arrive on the location',
                textColor: AppColor.textGrey,
                fontSize: SizeConfig.textMultiplier * 1.75,
                fontWeight: FontWeight.w500),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            ticketInfoCardTile(
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
              child: appText(
                  text: 'Date & Time',
                  fontSize: SizeConfig.textMultiplier * 2.24,
                  textColor: AppColor.textBlack),
            ),
            infoTile(
              iconUrl: 'assets/booking/icons/calender.png',
              title: '16, October 2021',
            ),
            infoTile(
                iconUrl: 'assets/booking/icons/clock.png',
                title: '5:00 PM to 6:00 PM'
                ),
            infoTile(
                iconUrl: 'assets/booking/icons/profile2.png',
                title: '4',
                borderColor: AppColor.white),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  text: 'Location',
                  fontSize: SizeConfig.textMultiplier * 2.24,
                  textColor: AppColor.textBlack),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            locationTile(
                currentLocation: bookingDetailVM.googleMapInitialPosition),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  text: 'Contact Information',
                  fontSize: SizeConfig.textMultiplier * 2.24,
                  textColor: AppColor.textBlack),
            ),
            infoTile(
                iconUrl: 'assets/booking/icons/sms.png',
                title: 'confirmation@info.com'),
            infoTile(
                iconUrl: 'assets/booking/icons/call.png',
                title: '+97463727273743',
                borderColor: AppColor.white),
            MySeparator(color: AppColor.textGrey.withOpacity(0.5)),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  text: 'Amenities',
                  fontSize: SizeConfig.textMultiplier * 2.24,
                  textColor: AppColor.textBlack),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 7.6,
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: bookingDetailVM.amenitiesList.length,
              itemBuilder: (context, index){
              return anemitiesTile(
                      imageUrl: bookingDetailVM.amenitiesList[index].imageUrl,
                      name: bookingDetailVM.amenitiesList[index].name);
            }),
            ),
            
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            MySeparator(color: AppColor.textGrey.withOpacity(0.5)),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            amountTile(title: 'Activity Price', amount: '420.00'),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            amountTile(title: 'Total Discount', amount: '0'),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            amountTile(title: 'Price After Discount', amount: '420.00'),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            amountTile(title: 'Taxes & Services Fees', amount: '30.00'),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            Container(
              height: 2,
              width: SizeConfig.widthMultiplier * 100,
              color: AppColor.textGrey.withOpacity(0.15),
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
          check == 0 ? appButton(
                butonWidth: SizeConfig.widthMultiplier * 100,
                buttonHeight: SizeConfig.heightMultiplier * 6.8,
                buttonColor: AppColor.red,
                voidCallback: () {
                  
                  menageBookingBottomSheet(
                      cancelBookingCallback: () {
                        
                        showDialog(
                            barrierDismissible: false,
                            context: Get.overlayContext!,
                            builder: (_) {
                              return CancelBookingDailog();
                            });
                      },
                      rescheduleBookingCallback: () {
                        Get.back();
                        Get.toNamed(AppRoutes.bookingDateTimeView,);
                      });
                },
                widget: appText(
                    text: 'Manage Booking',
                    fontSize: SizeConfig.textMultiplier * 2.0))
                    : appButton(
                butonWidth: SizeConfig.widthMultiplier * 100,
                buttonHeight: SizeConfig.heightMultiplier * 6.8,
                buttonColor: AppColor.parrotGreen,
                voidCallback: () {
                  
                        Get.toNamed(AppRoutes.bookingStarReviewView,);
                      
                },
                widget: appText(
                    text: 'Rate your Trip',
                    fontSize: SizeConfig.textMultiplier * 2.0)),
          
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            appButton(
                butonWidth: SizeConfig.widthMultiplier * 100,
                buttonHeight: SizeConfig.heightMultiplier * 6.8,
                borderColor: AppColor.textGrey,
                buttonColor: AppColor.white,
                voidCallback: () {
                  Get.toNamed(AppRoutes.complaintView);
                },
                widget: appText(
                    text: 'Complaint',
                    textColor: AppColor.textGrey,
                    fontSize: SizeConfig.textMultiplier * 2.0))
          ],
        ));
  }
}
