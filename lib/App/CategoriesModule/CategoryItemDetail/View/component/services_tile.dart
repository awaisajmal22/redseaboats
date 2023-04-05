import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';

Widget servicesTile(
    {
      required VoidCallback isFavoriteCallback,
      required bool isFavorite,
      required String discount,
      required Function(double?)? ratingCallback,
      required double initialRating,
      required String title,
      required String subtitle,
      required String location,
      required String price,
      required String imageUrl,
      required VoidCallback categoriesCallback
    }
  ) {
    return GestureDetector(
      onTap: categoriesCallback,
      child: Container(
                  padding: EdgeInsets.only(left:  SizeConfig.widthMultiplier * 4.0, top: SizeConfig.heightMultiplier * 1.6, bottom:  SizeConfig.heightMultiplier * 1.6),
                  margin: EdgeInsets.only( bottom: SizeConfig.heightMultiplier * 2.0),
                  height: SizeConfig.heightMultiplier * 21,
                  width: SizeConfig.widthMultiplier* 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: isFavoriteCallback,
                              child: Image(
                                image: AssetImage(isFavorite == false ? 'assets/interest/uncheck.png': 'assets/home/icons/heart.png'), width: 24, height: 24,)),
                          ),
                      discount == "null" || discount == '' ? SizedBox.shrink() :    Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomLeft: Radius.circular(6),
                                    
                                  ),
                                  color: AppColor.darkPink
                                ),
                                height: SizeConfig.heightMultiplier * 4,
                                width: SizeConfig.widthMultiplier * 27,
                                child: appText(text: '$discount% Discount', fontSize:  SizeConfig.textMultiplier * 1.4),
                              ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            
                            children: [
                         appText(
                          maxLines: 1,
                          text: title, fontSize: SizeConfig.textMultiplier * 2.25, textAlign: TextAlign.left),
                         SizedBox(
                           height: SizeConfig.heightMultiplier * 0.3,
                         ),
                         appText(
                          maxLines: 1,
                          text: subtitle, fontSize: SizeConfig.textMultiplier * 1.46, fontWeight: FontWeight.normal, textAlign: TextAlign.left),
                         SizedBox(
                           height: SizeConfig.heightMultiplier * 0.3,
                         ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             RatingBar.builder(
                               minRating: 1.0,
                               itemSize: SizeConfig.heightMultiplier * 1.25,
                               maxRating: 5.0,
                               initialRating: initialRating,
                               itemCount: 5,
                               allowHalfRating: true,
                               itemBuilder: (context, index){
                                 return const Icon(Icons.star, color: Color(0xffFDB515),);
                             }, 
                             onRatingUpdate: ratingCallback as double? Function(double?)
                             ),
                             SizedBox(
                               width: SizeConfig.widthMultiplier * 1.0,
                             ),
                             SizedBox(
                              width: SizeConfig.widthMultiplier * 10,
                              child: appText(
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                text: '2958', fontSize: SizeConfig.textMultiplier * 1.25, fontWeight: FontWeight.w400))
                           ],
                         ),
                          SizedBox(
                           height: SizeConfig.heightMultiplier * 0.3,
                         ),
                         
                         
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(FontAwesomeIcons.locationDot, size: SizeConfig.imageSizeMultiplier * 3.0, color: AppColor.white,),
                                 SizedBox(
                                   width: SizeConfig.widthMultiplier * 2.0,
                                 ),
                                 SizedBox(
                                  width: SizeConfig.widthMultiplier * 40,
                                  child: appText(
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    text: location, fontSize: SizeConfig.textMultiplier * 1.47, fontWeight: FontWeight.w400))
                               ],
                             ),
                             Container(
                               alignment: Alignment.center,
                               padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(4),
                                 color: AppColor.parrotGreen
                               ),
                               child: appText(text: 'AED $price/hr', fontSize: SizeConfig.textMultiplier * 1.46, ),
                             )
                           ],
                         )
                            ],
                          ),
                        ),
                      ),
    
                    ],
                  ),
                ),
    );
  }