import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/AppButton/app_button.dart';
import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';
import '../../../../../RoutesAndBindings/app_routes.dart';

bottomSheet({
    required VoidCallback emiratesIdCallback,
    required VoidCallback passportCallback,
    required VoidCallback continueCallback
  }) {
    Get.bottomSheet(
      isDismissible: false,
      BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        height: SizeConfig.heightMultiplier * 55,
        color: AppColor.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5.0),
            child: appText(
                text: 'Additional Information',
                fontSize: SizeConfig.textMultiplier * 3.0),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier * 5.0,
                  right: SizeConfig.widthMultiplier * 5.0,
                  top: SizeConfig.heightMultiplier * 3.5),
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: AppColor.white.withOpacity(1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(
                          text: 'Update Security Document',
                          textColor: AppColor.textBlack,
                          fontSize: SizeConfig.textMultiplier * 2.0),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRoutes.bookingDetailView);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            appText(
                                text: 'Skip',
                                fontSize: SizeConfig.textMultiplier * 1.5,
                                textColor: AppColor.textGrey,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 2.0,
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColor.textGrey,
                              size: SizeConfig.imageSizeMultiplier * 4.3,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 0.5,
                  ),
                  appText(
                    textAlign: TextAlign.start,
                      text:
                          "This is where we'll send your booking confirmation.",
                      fontSize: SizeConfig.textMultiplier * 1.5,
                      textColor: AppColor.textGrey,
                      fontWeight: FontWeight.w500),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                        decoration: BoxDecoration(
                          color: AppColor.whiteFC.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText(text: 'Emirates ID', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.0, fontWeight: FontWeight.w400),
                            GestureDetector(
                              onTap: emiratesIdCallback,
                              child: Container(
                                alignment: Alignment.center,
                                height: SizeConfig.heightMultiplier * 10,
                                width: SizeConfig.widthMultiplier * 24.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(8),
                                  color: AppColor.parrotGreen.withOpacity(0.95)
                                ),
                                child: appText(text: 'Upload', fontSize: SizeConfig.textMultiplier * 2.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            
                            
                          ],
                        ),
                      ),
                      SizedBox(
                              height: SizeConfig.heightMultiplier * 2.0,
                            ),
                              Container(
                        padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                        decoration: BoxDecoration(
                          color: AppColor.whiteFC.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText(text: 'Passport', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.0, fontWeight: FontWeight.w400),
                            GestureDetector(
                              onTap: passportCallback,
                              child: Container(
                                alignment: Alignment.center,
                                height: SizeConfig.heightMultiplier * 10,
                                width: SizeConfig.widthMultiplier * 24.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(8),
                                  color: AppColor.parrotGreen.withOpacity(0.95)
                                ),
                                child: appText(text: 'Upload', fontSize: SizeConfig.textMultiplier * 2.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            
                            
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 4.0,
                      ),
                     appButton(
              butonWidth: SizeConfig.widthMultiplier * 100,
              buttonHeight: SizeConfig.heightMultiplier * 6.8,
              voidCallback: continueCallback,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/category/paperplane.png'),
                    height: SizeConfig.heightMultiplier * 3.0,
                    width: SizeConfig.widthMultiplier * 6.0,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 3.2,
                  ),
                  appText(
                      text: 'Continue',
                      fontSize: SizeConfig.textMultiplier * 2.0)
                ],
              )),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }