import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/Seprator/my_seperator.dart';
import '../../../../../Common/SizeConfig/size_config.dart';
import '../../../../BookingModule/BookingDetail/View/Component/anemities_tile.dart';

Widget ticketDetailTile(
      {required RxInt selectedDurationIndex,
      required List amenitiesList,
      required String title,
      required String price,
      required double initialRating,
      required Function(double?)? ratingCallback,
      required String totalRating,
      required VoidCallback decreamentCallback,
      required VoidCallback increamentCallback,
      required VoidCallback itemDetailCallBack,
      required String itemCount,
      required VoidCallback moreServicesCallBack,
      required List durationList,
      required String noOfPerson}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5.0,
          vertical: SizeConfig.heightMultiplier * 2.0),
      margin:
          EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
      height: SizeConfig.heightMultiplier * 55,
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor1A.withOpacity(0.15),
                offset: Offset(0, 8),
                blurRadius: 15)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText(
                  text: title,
                  fontSize: SizeConfig.textMultiplier * 2.25,
                  textColor: AppColor.textBlack),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.parrotGreen),
                child: appText(
                  text: 'AED $price/hr',
                  fontSize: SizeConfig.textMultiplier * 1.46,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RatingBar.builder(
                  minRating: 1.0,
                  itemSize: SizeConfig.heightMultiplier * 2.0,
                  maxRating: 5.0,
                  initialRating: initialRating,
                  itemCount: 5,
                  allowHalfRating: true,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Color(0xffFDB515),
                    );
                  },
                  onRatingUpdate: ratingCallback as double? Function(double?)),
              SizedBox(
                width: SizeConfig.widthMultiplier * 1.0,
              ),
              appText(
                  text: totalRating,
                  fontSize: SizeConfig.textMultiplier * 1.25,
                  textColor: AppColor.textBlack,
                  fontWeight: FontWeight.w400)
            ],
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: itemDetailCallBack,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                        text: 'Fulfilled By',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        textColor: AppColor.red,
                        fontSize: SizeConfig.textMultiplier * 1.0),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.2,
                    ),
                    appText(
                        text: 'Dubai Water Sports',
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textBlack,
                        fontSize: SizeConfig.textMultiplier * 1.5),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: decreamentCallback,
                        child: Icon(
                          Icons.remove,
                          size: SizeConfig.imageSizeMultiplier * 4,
                          color: AppColor.textGrey,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 2.8,
                      ),
                      appText(
                          text: itemCount,
                          textColor: AppColor.textBlack,
                          fontSize: SizeConfig.textMultiplier * 1.5,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 2.8,
                      ),
                      GestureDetector(
                        onTap: increamentCallback,
                        child: Icon(
                          Icons.add,
                          size: SizeConfig.imageSizeMultiplier * 4,
                          color: AppColor.textGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 0.2,
                  ),
                  appText(
                      text: '$noOfPerson Persons',
                      fontSize: SizeConfig.textMultiplier * 1.0,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.textBlack)
                ],
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          MySeparator(
            color: AppColor.textGrey.withOpacity(0.3),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: moreServicesCallBack,
              child: appText(
                  fontWeight: FontWeight.w500,
                  text: 'More Services like this:',
                  textColor: AppColor.red,
                  fontSize: SizeConfig.textMultiplier * 1.5,
                  textDecoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
              fontWeight: FontWeight.w700,
              text: 'Duration',
              textColor: AppColor.textBlack,
              fontSize: SizeConfig.textMultiplier * 2.0,
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.0,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.8,
            child: ListView.builder(
                itemCount: durationList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    ()=> GestureDetector(
                      onTap: () {
                        selectedDurationIndex.value = index;
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              right: SizeConfig.widthMultiplier * 2.2),
                          decoration: BoxDecoration(
                              color: selectedDurationIndex.value == index
                                  ? AppColor.parrotGreen
                                  : AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: selectedDurationIndex.value == index
                                      ? AppColor.transparent
                                      : AppColor.textGrey.withOpacity(0.3),
                                  width: 1)),
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 2.6,
                              vertical: SizeConfig.heightMultiplier * 0.8),
                          child: appText(
                              text: '${durationList[index]} mins',
                              textColor: selectedDurationIndex.value == index
                                  ? AppColor.white
                                  : AppColor.textBlack,
                              fontSize: 10)),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
              fontWeight: FontWeight.w700,
              text: 'Amenities',
              textColor: AppColor.textBlack,
              fontSize: SizeConfig.textMultiplier * 2.0,
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.45,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 7.6,
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: amenitiesList.length,
              itemBuilder: (context, index){
              return anemitiesTile(
                      imageUrl: amenitiesList[index].imageUrl,
                      name: amenitiesList[index].name);
            }),
          ),
           SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
              fontWeight: FontWeight.w700,
              text: 'Overview',
              textColor: AppColor.textBlack,
              fontSize: SizeConfig.textMultiplier * 2.0,
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColor.textGrey.withOpacity(0.3),
                width: 1
              )
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 4.0,
              vertical: SizeConfig.heightMultiplier * 1.6,
              
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    appText(text: '4.8', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.5, fontWeight: FontWeight.w400),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 1.0,
                    ),
                    Icon(Icons.star, color:  Color(0xffFDB515), size: SizeConfig.imageSizeMultiplier * 4,),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 1.0,
                    ),
                    appText(text: 'Rating', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.5, fontWeight: FontWeight.w400),

                  ],
                ),
                Row(
                  children: [
                    Image(image: AssetImage('assets/category/meter.png'), height: SizeConfig.heightMultiplier * 2.2,width: SizeConfig.widthMultiplier * 4.4,),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 2.0,
                    ),
                    appText(text: '80%', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.5, fontWeight: FontWeight.w400),

                  ],
                ),
                Row(
                  children: [
                    appText(text: '12', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.5, fontWeight: FontWeight.w400),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 1.0,
                    ),
                    Image(image: AssetImage('assets/category/heart.png'), height: SizeConfig.heightMultiplier * 2.2,width: SizeConfig.widthMultiplier * 4.4,),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 1.0,
                    ),
                    appText(text: 'Likes', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.5, fontWeight: FontWeight.w400),

                  ],
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }