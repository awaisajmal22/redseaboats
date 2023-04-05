import 'package:flutter/material.dart';

import '../../../../../../Common/AppColors/app_colors.dart';
import '../../../../../../Common/AppText/appText.dart';
import '../../../../../../Common/SizeConfig/size_config.dart';

Widget categoryTile({
  required int index,
  required int length,
    required String imageUrl,
    required String title,
    required VoidCallback categoriesCallBack
  }) {
    return GestureDetector(
      onTap: categoriesCallBack,
      child: Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.6),
                  height: SizeConfig.heightMultiplier * 11.12,
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.heightMultiplier * 8.0,
                        width: SizeConfig.widthMultiplier * 16.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.0,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 16.0,
                        child: appText(
                          maxLines: 1,
                          text: title,fontSize:  SizeConfig.textMultiplier * 1.4, textColor: AppColor.textBlack),
                      )
                    ],
                  ),
                ),
    );
  }

  

Widget shimmercategoryTile() {
    return Container(
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.6),
                height: SizeConfig.heightMultiplier * 11.12,
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.heightMultiplier * 8.0,
                      width: SizeConfig.widthMultiplier * 16.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.white
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      height: SizeConfig.heightMultiplier * 1.4,
                      width: SizeConfig.widthMultiplier * 15,
                    )
                  //  appText(text: 'title',fontSize:  SizeConfig.textMultiplier * 1.4, textColor: AppColor.textBlack)
                  ],
                ),
              );
  }

  

