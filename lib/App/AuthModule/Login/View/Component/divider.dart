import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget orDivider() {
    return Row(
              children: [
                Expanded(child: Container(
                  height: 1,
                  color: Color(0xffCCCCCC),
                )),
                SizedBox(
                width: SizeConfig.widthMultiplier * 5.0,
                ),
                appText(text: 'Or', textColor: AppColor.textGrey, fontSize: SizeConfig.textMultiplier * 1.3, textAlign: TextAlign.center, fontWeight: FontWeight.w400),
                SizedBox(
                width: SizeConfig.widthMultiplier * 5.0,
                ),
                Expanded(child: Container(
                  height: 1,
                  color: Color(0xffCCCCCC),
                )),
                

              ],
            );
  }