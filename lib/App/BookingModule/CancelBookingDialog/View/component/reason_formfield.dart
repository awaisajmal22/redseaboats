 import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget reasonFormField({
    required TextEditingController controller
  }) {
    return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.textGrey.withOpacity(0.3),
                      width: 1
                    )
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2.8,
                    vertical: SizeConfig.heightMultiplier * 0.5
                  ),
                   child: TextFormField(
                    controller: controller,
                    cursorColor: AppColor.textGrey,
                    style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.5,
                      color: AppColor.textGrey,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500
                    ),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.5,
                      color: AppColor.textGrey,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500
                    ),
                      hintText: 'Enter your reason...',
                      border: InputBorder.none
                    ),
                   ),
                 );
  }