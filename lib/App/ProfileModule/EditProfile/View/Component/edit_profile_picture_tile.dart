 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget editProfilePicTile(
    {
      required String imageUrl,
      required VoidCallback voidCallback
    }
  ) {
    return GestureDetector(
      onTap: voidCallback,
      child: SizedBox(
              height: SizeConfig.heightMultiplier * 14.0,
              width: SizeConfig.widthMultiplier * 28.0,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: SizeConfig.heightMultiplier * 14.0,
                    width: SizeConfig.widthMultiplier * 28.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.shadow29.withOpacity(0.15),
                          offset: const Offset(0, 8),
                          blurRadius: 15
                        ),
                        
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.white,
                        width: 4
                      ),
                      image: imageUrl.isNotEmpty ? DecorationImage(
                        image:
                        FileImage(File(imageUrl), ), fit: BoxFit.cover
                        ) : DecorationImage(
                          image: NetworkImage('https://cdn.pixabay.com/photo/2016/11/12/11/51/animals-1818690__340.jpg'),
                          fit: BoxFit.cover
                        )
                    ),
                  ),
                  Positioned(
                    right: SizeConfig.widthMultiplier * 4.5,
                    child: Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                        
                      ),
                      child: Icon(FontAwesomeIcons.cameraAlt, size: 14, color: AppColor.parrotGreen,),
                  )
                  )
                ],
              ),
            ),
    );
  }