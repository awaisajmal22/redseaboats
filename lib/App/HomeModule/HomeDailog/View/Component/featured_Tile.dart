import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget featuredTile({
  required int index,
  required int length,
  required bool isFavorite,
  required VoidCallback isFavoriteCallback,
  required String discount,
  required String title,
  required String subtitle,
  required String description,
  required String location,
  required String price,
  required VoidCallback callBack,
  required BuildContext context,
  required Function(double?)? ratingCallback,
  required double initialRating,
  required String ratingTitle,
  required String imageUrl
  }
) {
  return GestureDetector(
    onTap: callBack,
    child: Container(
                      margin:  EdgeInsets.symmetric(horizontal:  SizeConfig.widthMultiplier * 2.0),
                      height: SizeConfig.heightMultiplier * 50,
                      width: SizeConfig.widthMultiplier * 75,
                      decoration: BoxDecoration(
                       
                        borderRadius: BorderRadius.circular(14),
                        image:  DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: isFavoriteCallback,
                          child: Image(
                            image: AssetImage(isFavorite == false ? 'assets/interest/uncheck.png': 'assets/home/icons/heart.png'), width: 24, height: 24,)),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.0,
                    ),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                  
                                ),
                                color: AppColor.red
                              ),
                              height: SizeConfig.heightMultiplier * 5.0,
                              width: SizeConfig.widthMultiplier * 37,
                              child: appText(text: '$discount% Discount', fontSize: SizeConfig.textMultiplier * 2.0),
                            ),
                             Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                              appText(text: title, fontSize: SizeConfig.textMultiplier * 2.25, textAlign: TextAlign.left),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 0.5,
                              ),
                              appText(text: subtitle, fontSize: SizeConfig.textMultiplier * 1.46, fontWeight: FontWeight.normal, textAlign: TextAlign.left),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 0.5,
                              ),
                              Row(
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
                                  }, onRatingUpdate: ratingCallback as double? Function(double?)
                                  ),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier * 1.0,
                                  ),
                                  appText(text: ratingTitle, fontSize: SizeConfig.textMultiplier * 1.25)
                                ],
                              ),
                               SizedBox(
                                height: SizeConfig.heightMultiplier * 0.5,
                              ),
                              appText(text: description, fontSize:SizeConfig.textMultiplier * 1.46, fontWeight: FontWeight.w400,textAlign: TextAlign.left, textOverFlow: TextOverflow.ellipsis ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 0.9,
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
                                      appText(text: location, fontSize: SizeConfig.textMultiplier * 1.47, fontWeight: FontWeight.w400)
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColor.parrotGreen
                                    ),
                                    child: appText(text: price, fontSize: SizeConfig.textMultiplier * 1.46, ),
                                  )
                                ],
                              )
                            ],
                          ),
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