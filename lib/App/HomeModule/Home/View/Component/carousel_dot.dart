import 'package:flutter/material.dart';

import '../../../../../../Common/AppColors/app_colors.dart';

Row carouselDots({
    int length = 0,
   int selectedIndex = 0,
    double height = 6,
    double width = 6,
    }
  ) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(length, (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? AppColor.parrotGreen : AppColor.white,
                      shape: BoxShape.circle
                    ),
                    
                  )),
                );
  }