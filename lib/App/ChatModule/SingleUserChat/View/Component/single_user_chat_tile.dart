 import 'package:flutter/material.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget singleUserChatTile({
    required bool check,
    required String msg,
    required String time
  }) {
    return Align(
          alignment: (check == false ?Alignment.topLeft : Alignment.topRight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
            // ignore: unrelated_type_equality_checks
            check == false ?  Container(
              margin: EdgeInsets.only(right:  SizeConfig.widthMultiplier * 1.2, top: SizeConfig.heightMultiplier * 1.0),
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2016/02/22/10/06/hedgehog-1215140__340.jpg'), fit: BoxFit.cover)
                ),
              ): const SizedBox.shrink(),
              
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          bottomRight: check == false ? const Radius.circular(10) : const Radius.circular(0),
                          bottomLeft: check == true ? const Radius.circular(10) : const Radius.circular(0)
                        ),
                        color: (check == false ? AppColor.whiteFC : AppColor.parrotGreen),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4.5,
                       vertical: SizeConfig.heightMultiplier * 1.5,
                      ),
                      child: appText(
                        maxLines: 50,
                        text: msg, 
                        fontSize: SizeConfig.textMultiplier * 1.75,
                        textColor: check == false ? AppColor.textBlack : AppColor.white,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.left
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.0,
                    ),
                    appText(text: time.toString(), fontSize: SizeConfig.heightMultiplier * 1.25, fontWeight: FontWeight.w400, textColor: AppColor.textGrey)
                  ],
                ),
              ),
            ],
          ),
          );
  }