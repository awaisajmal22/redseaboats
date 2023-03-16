import 'package:flutter/material.dart';

import '../../../../Common/AppColors/app_colors.dart';
import '../../../../Common/AppText/appText.dart';
import '../../../../Common/SizeConfig/size_config.dart';
import 'next_page_button.dart';

Widget nextPageTile({
    required int pageIndex,
    required VoidCallback nextPageCallback,
    required int pagesLength,
    required VoidCallback skipVoidCallback
  }) {
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: SizeConfig.heightMultiplier * 76,
              width: SizeConfig.widthMultiplier * 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: List.generate(pagesLength, (index) =>  Container(
                            margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1.0),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: pageIndex == index ? AppColor.parrotGreen : const Color(0xffDDDDDD)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         nextpageButton(
                           
                            voidCallback: nextPageCallback, widget: Row(
                            children: [
                               AnimatedContainer(
                                alignment: Alignment.center,
                                height: SizeConfig.heightMultiplier * 4.5,
                                width: pageIndex == 2 ? SizeConfig.widthMultiplier * 26 : SizeConfig.widthMultiplier * 13.0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                child: appText(text: pageIndex == 2 ? 'Get Started': 'Next', textOverFlow: TextOverflow.visible)),
                              const SizedBox(
                                width: 9,
                              ),
                              const Icon(Icons.arrow_forward, color: AppColor.white,)
                            ],
                           )),
                         pageIndex == 2 ? SizedBox() :
                         GestureDetector(
                          onTap: skipVoidCallback,
                          child: appText(text: 'Skip', textColor: AppColor.textBlack),
                         )
                        ],
                      )
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pagesLength, (index) =>  Container(

                      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1.0, vertical: SizeConfig.heightMultiplier * 3.0),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: pageIndex == index ? Colors.purple : AppColor.white
                      ),
                    ),
                  )),
                
                ],
              ),
            );
  }
