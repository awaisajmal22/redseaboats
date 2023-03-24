 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget searchTile({
    required VoidCallback searchCallback,
    required TextEditingController controller,
    required VoidCallback filterCallBack
  }) {
    return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5.0),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: controller,
                cursorColor: AppColor.cursorColor,
                style: TextStyle(
                    color: AppColor.textGrey,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.textMultiplier * 1.88),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close_outlined,
                        color: AppColor.textGrey,
                        size: 14,
                      ),
                    ),
                    prefixIcon: GestureDetector(
                      onTap: searchCallback,
                      child: const Icon(
                        FontAwesomeIcons.search,
                        color: AppColor.textGrey,
                        size: 14,
                      ),
                    ),
                    hintStyle: TextStyle(
                        color: AppColor.textGrey,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.textMultiplier * 1.88),
                    hintText: 'Search Services',
                    fillColor: AppColor.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
              )),
              SizedBox(
                width: SizeConfig.widthMultiplier * 3.0,
              ),
              GestureDetector(
                  onTap: filterCallBack,
                  child: const ImageIcon(
                    AssetImage('assets/home/icons/slider.png'),
                    color: AppColor.white,
                  )),
                  
            ],
          ),
        );
  }