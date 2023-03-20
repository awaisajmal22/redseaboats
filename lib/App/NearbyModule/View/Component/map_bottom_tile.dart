import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Common/AppColors/app_colors.dart';
import '../../../../Common/AppText/appText.dart';
import '../../../../Common/SizeConfig/size_config.dart';

Widget mapBottomTile({
    required String imageUrl,
    required String title,
    required double initialRating,
    required Function(double?)? onratingupdate,
    required String totalRating,
    required String locationName
  }) {
    return Container(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1.4, vertical: SizeConfig.heightMultiplier * 1.0),
                      margin: EdgeInsets.only( right: SizeConfig.widthMultiplier * 5.6),
                      height: SizeConfig.heightMultiplier * 11.1,
                      width: SizeConfig.widthMultiplier * 75.8,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.textGrey.withOpacity(0.15),
                            offset: Offset(0, 8),
                            blurRadius: 15
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image(image: NetworkImage(imageUrl), height: SizeConfig.heightMultiplier * 11.1,
                            width: SizeConfig.widthMultiplier * 18, fit: BoxFit.cover,),
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier * 3.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText(text: title, textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.0),
                              Row(
                                children: [
                                  RatingBar.builder(
                                itemSize: SizeConfig.imageSizeMultiplier * 3.0,
                                initialRating: initialRating,
                                minRating: 1,
                                maxRating: 5,
                                itemBuilder: (context, index){
                                return Icon(Icons.star, color: Color(0xffFDB515));
                              }, 
                              onRatingUpdate: onratingupdate as double? Function(double?)
                              ),
                              SizedBox(
                                width: SizeConfig.widthMultiplier * 1.2,
                              ), 
                              appText(text: totalRating, fontSize: SizeConfig.textMultiplier * 1.15, textColor: AppColor.textBlack, fontWeight: FontWeight.w400)

                                ],
                              ),
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.locationDot, color: AppColor.parrotGreen, size: SizeConfig.imageSizeMultiplier * 3.0,),
                                  SizedBox(
                                  width: SizeConfig.widthMultiplier * 1.4,
                                  ),
                                  appText(text: locationName, fontSize: SizeConfig.textMultiplier * 1.5, textColor: AppColor.textGrey, fontWeight: FontWeight.w500)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
  }