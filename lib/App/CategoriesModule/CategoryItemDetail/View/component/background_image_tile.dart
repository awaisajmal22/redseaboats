import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/SizeConfig/size_config.dart';

Widget backgroundItemImageTile({
    required String imageUrl,
    required VoidCallback chatCallback

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
            height: SizeConfig.heightMultiplier * 42,
            width: SizeConfig.widthMultiplier * 100,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Image(image: const AssetImage('assets/category/back.png'), fit: BoxFit.cover,height: SizeConfig.heightMultiplier * 5.6, width: SizeConfig.widthMultiplier * 11.2,)),
                    GestureDetector(
                            onTap: chatCallback,
                            child: Image(
                              image: const AssetImage('assets/category/chat.png'), width: SizeConfig.widthMultiplier * 9.2, height: SizeConfig.heightMultiplier * 4.6,)),
                        
                ],
              )),
          );
  }