import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/SizeConfig/size_config.dart';

Widget backgroundImageTile({
    required String imageUrl,
    required bool isFavorite,
    required VoidCallback favoriteCallback

  }) {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
            ),
            height: SizeConfig.heightMultiplier * 45,
            width: SizeConfig.widthMultiplier * 100,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Image(image: AssetImage('assets/category/back.png'), fit: BoxFit.cover,height: SizeConfig.heightMultiplier * 5.6, width: SizeConfig.widthMultiplier * 11.2,)),
                    GestureDetector(
                            onTap: favoriteCallback,
                            child: Image(
                              image: AssetImage(isFavorite == false ? 'assets/interest/uncheck.png': 'assets/home/icons/heart.png'), width: SizeConfig.widthMultiplier * 9.2, height: SizeConfig.heightMultiplier * 4.6,)),
                        
                ],
              )),
          );
  }