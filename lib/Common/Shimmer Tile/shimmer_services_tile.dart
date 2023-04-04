import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../AppColors/app_colors.dart';
import '../AppText/appText.dart';
import '../SizeConfig/size_config.dart';

Widget shimmerServicesTile(
  
  ) {
    return Container(
                padding: EdgeInsets.only(left:  SizeConfig.widthMultiplier * 4.0, top: SizeConfig.heightMultiplier * 1.6, bottom:  SizeConfig.heightMultiplier * 1.6),
                margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 5.3),
                height: SizeConfig.heightMultiplier * 22.5,
                width: SizeConfig.widthMultiplier* 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                 
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                shape: BoxShape.circle
                              )
                              , width: 24, height: 24,
                              ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomLeft: Radius.circular(6),
                                    
                                  ),
                                  color: AppColor.white
                                ),
                                height: SizeConfig.heightMultiplier * 4,
                                width: SizeConfig.widthMultiplier * 27,
                                
                              ),
                          )
                        ],
                      ),
                    ),
                   Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                           Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [
                           Container(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            height: SizeConfig.heightMultiplier * 2.25,
                            width: SizeConfig.widthMultiplier * 20,
                           ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 0.5,
                            ),
                             Container(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            height: SizeConfig.heightMultiplier *1.46,
                            width: SizeConfig.widthMultiplier * 25,
                           ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 0.5,
                            ),
                            Row(
                              children: [
                                 Container(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            height: SizeConfig.heightMultiplier * 1.25,
                            width: SizeConfig.widthMultiplier * 15,
                           ),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 1.0,
                                ),
                                 Container(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            height: SizeConfig.heightMultiplier * 1.25,
                            width: SizeConfig.widthMultiplier * 5,
                           ),
                              ],
                            ),
                             SizedBox(
                              height: SizeConfig.heightMultiplier * 0.5,
                            ),
                             Container(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            height: SizeConfig.heightMultiplier * 1.46,
                            width: SizeConfig.widthMultiplier * 30,
                           ),
                            
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
                                     Container(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            height: SizeConfig.heightMultiplier * 1.47,
                            width: SizeConfig.widthMultiplier * 20,
                           ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColor.white
                                  ),
                                  height: SizeConfig.heightMultiplier * 1.46,
                                  width: SizeConfig.widthMultiplier * 10,
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
              );
  }

  