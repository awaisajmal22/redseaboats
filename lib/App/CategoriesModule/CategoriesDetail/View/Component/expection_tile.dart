import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget expectionTile({
    required bool check,
    required String title,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         check  == true
                              ? Icon(
                                  Icons.check,
                                  color: AppColor.lightGreen,
                                  size: SizeConfig.imageSizeMultiplier * 3.75,
                                )
                              : Icon(
                                  Icons.close,
                                  color: AppColor.red,
                                  size: SizeConfig.imageSizeMultiplier * 3.75,
                                ),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 3,
                                ),
                                Expanded(
                                  child: appText(
                                    maxLines: 20,
                                    textAlign: TextAlign.left,
                                    text: title, textColor: AppColor.textGrey, fontSize: SizeConfig.textMultiplier * 1.6, fontWeight:  FontWeight.w400),
                                )
                        ],
                      );
  }