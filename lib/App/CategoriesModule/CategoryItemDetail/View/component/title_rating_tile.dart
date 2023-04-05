import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget titleRatingTile(
      {required String title,
      required String totalRating,
      required Function(double?)? ratingCallback,
      required double initialRating,
      required String subtitle,
      required String time}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5.0,
          vertical: SizeConfig.heightMultiplier * 1.7),
      // height: SizeConfig.heightMultiplier * 15.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor1A.withOpacity(0.15),
                offset: Offset(0, 8),
                blurRadius: 15)
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: appText(
                maxLines: 1,
                  text: title,
                  textAlign: TextAlign.left,
                  fontSize: SizeConfig.textMultiplier * 2.24,
                  textColor: AppColor.textBlack),
            ),
            Image(
              image: AssetImage('assets/home/icons/heart.png'),
              width: SizeConfig.widthMultiplier * 7.2,
              height: SizeConfig.heightMultiplier * 3.6,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 0.65,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RatingBar.builder(
                minRating: 1.0,
                itemSize: SizeConfig.heightMultiplier * 2.0,
                maxRating: 5.0,
                initialRating: initialRating,
                itemCount: 5,
                allowHalfRating: true,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Color(0xffFDB515),
                  );
                },
                onRatingUpdate: ratingCallback as double? Function(double?)),
            SizedBox(
              width: SizeConfig.widthMultiplier * 1.0,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 10,
              child: appText(
                textAlign: TextAlign.left,
                maxLines: 1,
                  text: totalRating,
                  fontSize: SizeConfig.textMultiplier * 1.25,
                  textColor: AppColor.textBlack,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 0.5,
        ),
        appText(
          maxLines: 1,
            textAlign: TextAlign.left,
            text: subtitle,
            fontSize: SizeConfig.textMultiplier * 1.5,
            textColor: AppColor.textGrey,
            fontWeight: FontWeight.w500),
        SizedBox(
          height: SizeConfig.heightMultiplier * 0.7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.clock,
              color: AppColor.red,
              size: SizeConfig.imageSizeMultiplier * 3.2,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 1.6,
            ),
            appText(
                text: time,
                fontSize: SizeConfig.textMultiplier * 1.5,
                fontWeight: FontWeight.w500,
                textColor: AppColor.red)
          ],
        )
      ]),
    );
  }