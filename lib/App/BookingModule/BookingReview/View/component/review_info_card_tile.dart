import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../Common/AppColors/app_colors.dart';
import '../../../../../../Common/AppText/appText.dart';
import '../../../../../../Common/SizeConfig/size_config.dart';

Widget reviewInfoCardTile(
      {required String title,
      required String imageUrl,
      required double initialRating,
      required Function(double?)? onratingupdate,
      required String locationName,
      required String time,
      required String totalRating}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 3.0,
          vertical: SizeConfig.heightMultiplier * 1.0),
      height: SizeConfig.heightMultiplier * 13.2,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor1A.withOpacity(0.15),
                offset: Offset(0, 8),
                blurRadius: 15)
          ]),
      width: SizeConfig.widthMultiplier * 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 11.2,
            width: SizeConfig.widthMultiplier * 22.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 4.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(
                  text: title,
                  textColor: AppColor.textBlack,
                  fontSize: SizeConfig.textMultiplier * 2.24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                      itemSize: 10,
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
                      fontSize: SizeConfig.textMultiplier * 1.25,
                      textColor: AppColor.textBlack,
                      fontWeight: FontWeight.w400),
                ],
              ),
              appText(text: locationName, textColor: AppColor.parrotGreen, fontWeight: FontWeight.w500, fontSize: SizeConfig.textMultiplier *1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.clock,color: AppColor.textBlack, size: SizeConfig.imageSizeMultiplier * 3.0,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 1.5,
                  ),
                  appText(text: time, textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.25, fontWeight: FontWeight.w500)
                ],
              )
            ],
          )
        ],
      ),
    );
  }