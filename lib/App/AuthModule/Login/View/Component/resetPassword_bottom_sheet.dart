import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../../Common/AppButton/app_button.dart';
import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/FormField/custom_formfield.dart';

resetPasswordBottomSheet(
      {required List<TextEditingController> controller,
      required List hintText,
      required List<RxBool> obecureText,
      required VoidCallback resetCallback}) {
    Get.bottomSheet(
        isDismissible: false,
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5.0,
                vertical: SizeConfig.heightMultiplier * 2.5),
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: SizeConfig.heightMultiplier * 53,
            width: SizeConfig.widthMultiplier * 100,
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: SizeConfig.heightMultiplier * 0.8,
                  width: SizeConfig.widthMultiplier * 35,
                  decoration: BoxDecoration(
                      color: const Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3.0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    appText(
                        text: 'Reset Password',
                        textAlign: TextAlign.left,
                        textColor: AppColor.textBlack,
                        fontSize: SizeConfig.textMultiplier * 2.8),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.0,
                    ),
                    appText(
                        maxLines: 20,
                        textAlign: TextAlign.left,
                        text:
                            "Set the new password for your account so you can login and access all the features.",
                        textColor: AppColor.textGrey,
                        fontSize: SizeConfig.textMultiplier * 1.75,
                        fontWeight: FontWeight.w400),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3.0,
                    ),
                    for (int i = 0; i < 2; i++)
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.widthMultiplier * 5.0),
                            // height: SizeConfig.heightMultiplier * 15,
                            width: SizeConfig.widthMultiplier * 100,
                            decoration: BoxDecoration(
                                color: AppColor.whiteFC.withOpacity(0.95),
                                borderRadius: BorderRadius.circular(8)),
                            child: Obx(
                              () => customFormField(
                                  obsecureText: obecureText[i].value,
                                  textInputAction: TextInputAction.done,
                                  isObsecure: () {
                                    obecureText[i].value =
                                        !obecureText[i].value;
                                  },
                                  validator: (value) {},
                                  suffixIcon: obecureText[i].value == true
                                      ? const Icon(
                                          Icons.visibility,
                                          color: AppColor.textGrey,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: AppColor.textGrey,
                                        ),
                                  controller: controller[i],
                                  hintText: hintText[i]),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 1.8,
                          )
                        ],
                      ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3.0,
                    ),
                    appButton(
                        butonWidth: SizeConfig.widthMultiplier * 100,
                        buttonHeight: SizeConfig.heightMultiplier * 6.8,
                        voidCallback: resetCallback,
                        widget: appText(
                            text: 'Reset Password',
                            fontSize: SizeConfig.textMultiplier * 2.0))
                  ],
                ),
              ),
            ])));
  }