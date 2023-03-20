import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Common/AppColors/app_colors.dart';
import '../../../../Common/SizeConfig/size_config.dart';

Widget chatSearchTile({
    required TextEditingController controller
  }) {
    return TextFormField(
      controller: controller,
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 1.45,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins'
              ),
            cursorColor: AppColor.textGrey,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: SizeConfig.textMultiplier * 1.45,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins'
              ),
              hintText: 'Search Chat',
              prefixIcon: Icon(FontAwesomeIcons.search, color: AppColor.textGrey,size: SizeConfig.imageSizeMultiplier * 3.4,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColor.transparent
                )
              ),
              enabledBorder: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColor.transparent
                )
              ),
              fillColor: AppColor.textGrey.withOpacity(0.055),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColor.transparent
                )
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 1.0
              )
            ),
          );
  }