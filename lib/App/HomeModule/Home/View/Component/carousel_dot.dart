import 'package:flutter/material.dart';

import '../../../../../../Common/AppColors/app_colors.dart';

Row carouselDots({
    required int length,
    required int selectedIndex
    }
  ) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(length, (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? AppColor.parrotGreen : AppColor.white,
                      shape: BoxShape.circle
                    ),
                    
                  )),
                );
  }