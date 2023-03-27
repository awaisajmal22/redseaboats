import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';

Widget ranegSliderTile({
    required double startValue,
    required double endValue,
    required Function(RangeValues?)? voidCallBack
  }) {
    return RangeSlider(
            
            min: 0.0,
            
            labels: RangeLabels(
              'AED ${startValue.round()}', 'AED ${endValue.round()}'),
            inactiveColor: AppColor.textGrey.withOpacity(0.15),
            divisions: 5,
            activeColor: AppColor.parrotGreen,
            max: 200,
            values: RangeValues(startValue, endValue),
             onChanged: voidCallBack as RangeValues? Function(RangeValues?)
            );
  }