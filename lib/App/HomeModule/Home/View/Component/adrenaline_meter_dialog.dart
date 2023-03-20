 import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';
import 'adrenline_meter.dart';

Widget adrenalineMeterDailog() {
    return Container(
            height: SizeConfig.heightMultiplier * 50,
            width:  SizeConfig.widthMultiplier * 100,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
            color: AppColor.transparent,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2.0),
                  height: SizeConfig.heightMultiplier * 48,
                  width: SizeConfig.widthMultiplier * 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColor.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, ),
                        child: appText(text: "Adrenaline Meter", fontSize: SizeConfig.textMultiplier * 2.4, textColor:  AppColor.textBlack),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.0,
                      ),
                      Padding(
                         padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, ),
                        child: appText(
                          maxLines: 20,
                          fontSize: SizeConfig.textMultiplier * 1.8,
                          fontWeight: FontWeight.w400,
                          text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s specimen book.",
                        textAlign: 
                        TextAlign.justify,textColor: AppColor.textGrey),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 25,
                        width: SizeConfig.widthMultiplier * 100,
                        child:  Lottie.asset('assets/home/icons/meter.json'),
                      )

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3.5),
                  child: Align(
                    alignment: Alignment.topRight,
                  child: Transform.rotate(
                    angle: 180 * pi / 180,
                    child: ClipPath(
                      clipper: MyTriangle(),
                      child: Container(
                        color: AppColor.white,
                        height: SizeConfig.heightMultiplier * 2,
                        width:  SizeConfig.widthMultiplier * 5,
                      ),
                    ),
                  )
                  ),
                )
              ],
            ),
          );
  }

 

  

  

class MyTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([
      Offset(0, size.height),
      Offset(size.width / 2, 0),
      Offset(size.width, size.height)
    ], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}