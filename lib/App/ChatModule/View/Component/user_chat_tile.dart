import 'package:flutter/material.dart';

import '../../../../Common/AppColors/app_colors.dart';
import '../../../../Common/AppText/appText.dart';
import '../../../../Common/SizeConfig/size_config.dart';

Widget userChatTile({
    required String userImage,
    required String userName,
    required String msg,
    required String time,
    required String textCount,
    required int index,
    required VoidCallback voidCallback
  }) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: voidCallback,
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier * 8.0,
                    width: SizeConfig.widthMultiplier * 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 6.0,
                          width: SizeConfig.widthMultiplier * 12.0,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: SizeConfig.heightMultiplier * 6.0,
                                width: SizeConfig.widthMultiplier * 12.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: NetworkImage(userImage), fit: BoxFit.cover)
                                ),
                              ),
                              Positioned(
                                left: 5,
                                child: Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.white,
                                      width: 3
                                    ),
                                    shape: BoxShape.circle,
                                    color: AppColor.lightGreen
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3.4,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 56.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText(text: userName, fontSize: SizeConfig.textMultiplier * 1.75, textColor: AppColor.textBlack),
                              appText(text: msg, 
                              textAlign: TextAlign.left,
                              fontSize: SizeConfig.textMultiplier * 1.45,
                               textColor:  AppColor.textGrey, 
                               fontWeight: FontWeight.w400, maxLines: 1, 
                               textOverFlow: TextOverflow.ellipsis
                               ),
                              
                            ],
                          ),
                        ),
                         SizedBox(
                                width: SizeConfig.widthMultiplier * 4.6,
                               ),
                               SizedBox(
                                width: SizeConfig.widthMultiplier * 10.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    appText(text: time , fontSize: SizeConfig.textMultiplier * 1.25, textColor: AppColor.textGrey, fontWeight: FontWeight.w400),
                                    SizedBox(
                                      height: SizeConfig.heightMultiplier * 0.6,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: SizeConfig.heightMultiplier * 2.1,
                                      width: SizeConfig.widthMultiplier * 5.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.red,                                      
                                      ),
                                      child: appText(text: textCount , fontSize: SizeConfig.textMultiplier * 1.15, fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                               )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: SizeConfig.widthMultiplier * 75,
                  color: index == 5 - 1 ? AppColor.transparent : AppColor.textGrey.withOpacity(0.15),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1.75,
                )
              ],
            );
  }