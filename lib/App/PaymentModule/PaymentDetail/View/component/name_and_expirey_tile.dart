 import 'package:flutter/material.dart';

import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget nameAndExpiryTile({
    required String title,
    required String subtitle
  }) {
    return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  appText(text: title,fontSize: SizeConfig.textMultiplier * 0.9, fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 0.6,
                                  ),
                                  appText(text: subtitle,fontSize: SizeConfig.textMultiplier * 1.45, ),

                                ],
                              );
  }