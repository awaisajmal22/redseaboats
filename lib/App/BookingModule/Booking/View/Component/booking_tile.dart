import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget bookingTile(
    {required String title,
    required String locationName,
    required String timing,
    required String date,
    required String personQuantity,
    required String imageUrl,
    required String price,
    required String ticketNumber,
    required Function(double?)? onratingupdate,
    required double initialRating,
    required String totalRating,
    required VoidCallback voidCallback}) {
  return GestureDetector(
    onTap: voidCallback,
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5.0,
          vertical: SizeConfig.heightMultiplier * 1.4),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0xff00000D).withOpacity(0.1),
                offset: Offset(0, 8),
                blurRadius: 32)
          ]),
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5.0,
          vertical: SizeConfig.heightMultiplier * 2.0),
      height: SizeConfig.heightMultiplier * 20.3,
      width: SizeConfig.widthMultiplier * 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Column 1
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText(
                  text: title,
                  fontSize: SizeConfig.textMultiplier * 1.9,
                  textColor: AppColor.textBlack),
              SizedBox(
                height: SizeConfig.heightMultiplier * 0.5,
              ),
              appText(
                  text: locationName,
                  fontSize: SizeConfig.textMultiplier * 1.25,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.textBlack),
              SizedBox(
                height: SizeConfig.heightMultiplier * 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                      itemSize: 8.97,
                      initialRating: initialRating,
                      minRating: 1,
                      maxRating: 5,
                      itemBuilder: (context, index) {
                        return Icon(Icons.star, color: Color(0xffFDB515));
                      },
                      onRatingUpdate:
                          onratingupdate as double? Function(double?)),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 1.2,
                  ),
                  appText(
                      text: totalRating,
                      fontSize: SizeConfig.textMultiplier * 1.15,
                      textColor: AppColor.textBlack,
                      fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    FontAwesomeIcons.clock,
                    color: AppColor.parrotGreen,
                    size: SizeConfig.imageSizeMultiplier * 4,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 2.0,
                  ),
                  appText(
                      text: timing,
                      fontSize: SizeConfig.textMultiplier * 1.25,
                      textColor: AppColor.textBlack,
                      fontWeight: FontWeight.w500),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/booking/icons/calender.png'),
                    color: AppColor.parrotGreen,
                    size: SizeConfig.imageSizeMultiplier * 4,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 2.0,
                  ),
                  appText(
                      text: date,
                      fontSize: SizeConfig.textMultiplier * 1.25,
                      textColor: AppColor.textBlack,
                      fontWeight: FontWeight.w500),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/booking/icons/profile2.png'),
                    color: AppColor.parrotGreen,
                    size: SizeConfig.imageSizeMultiplier * 4,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 2.0,
                  ),
                  appText(
                      text: '$personQuantity Persons',
                      fontSize: SizeConfig.textMultiplier * 1.25,
                      textColor: AppColor.textBlack,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
          //Column 2
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
                height: SizeConfig.heightMultiplier * 10,
                width: SizeConfig.widthMultiplier * 21.5,
              ),
              appText(
                  text: 'AED $price',
                  textColor: AppColor.parrotGreen,
                  fontSize: SizeConfig.textMultiplier * 2.0),
              appText(
                  text: 'No: $ticketNumber',
                  fontSize: SizeConfig.textMultiplier * 1.25,
                  textColor: AppColor.red,
                  fontWeight: FontWeight.w500)
            ],
          )
        ],
      ),
    ),
  );
}
