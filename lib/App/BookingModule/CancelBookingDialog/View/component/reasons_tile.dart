import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget reasonTile({
    required bool check,
    required String title,
    required VoidCallback voidCallback
  }) {
    return Column(
                    children: [
                      GestureDetector(
                        onTap: voidCallback,
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(check == true ? 'assets/booking/icons/check.png': 'assets/booking/icons/uncheck.png'), 
                              fit: BoxFit.cover,
                              width: SizeConfig.heightMultiplier * 2.25,
                              height: SizeConfig.widthMultiplier * 4.50,
                            ),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 3.0,
                            ),
                            appText(
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        text: title, textColor: AppColor.textBlack,
                      fontSize: SizeConfig.textMultiplier * 1.45,
                      fontWeight: FontWeight.w500
                      )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 2.0,),
                      
                    ],
                  );
  }