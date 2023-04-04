import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/CategoriesModule/CategoriesDetail/View/Component/background_image_tile.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../HomeModule/Home/View/Component/interest_tile.dart';
import '../../../HomeModule/Home/View/Component/seeall_title_tile.dart';
import '../../../HomeModule/Home/ViewModel/home_view_model.dart';
import '../../../ProfileModule/Favorite/ViewModel/favroite_view_model.dart';
import '../../Categories/View/Component/categories_tile.dart';
import 'component/background_image_tile.dart';
import 'component/services_tile.dart';

class CategoryItemDetailView extends StatelessWidget {
  CategoryItemDetailView({super.key});
  final homeVM = Get.find<HomeViewModel>();
  final favoriteVM = Get.find<FavoriteViewModel>();
  var imageURl = Get.arguments[0];
  var isFavorite = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 50,
            width: SizeConfig.widthMultiplier * 100,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                backgroundItemImageTile(
                    imageUrl:
                        'https://cdn.pixabay.com/photo/2016/11/22/19/26/fox-1850186__340.jpg',
                    chatCallback: () {}),
                Positioned(
                    bottom: 0,
                    left: SizeConfig.widthMultiplier * 5.0,
                    right: SizeConfig.widthMultiplier * 5.0,
                    child: titleRatingTile(
                        time: '5:00 PM to 6:00 PM | Sun - Sat',
                        subtitle: 'Al Seyahi St, Dubai Marina, Dubai - UAE',
                        initialRating: 3,
                        ratingCallback: (value) {},
                        totalRating: '2965',
                        title: 'Dubai Water Sports'))
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                    text: 'About Us',
                    fontSize: SizeConfig.textMultiplier * 2.24,
                    textColor: AppColor.textBlack),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1.5,
                ),
                appText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    textAlign: TextAlign.left,
                    textColor: AppColor.textGrey,
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                seeAllTitleTile(
                    buttonTitle: "View All",
                    seeAllCallBack: () {},
                    title: 'Featured Services'),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 50,
            child: ListView.builder(
                padding:
                    EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                scrollDirection: Axis.horizontal,
                itemCount: homeVM.homDailogList.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => interestTile(
                        imageUrl: homeVM.homDailogList[index].imageUrl,
                        isDailogCheck: homeVM.isDailogCheck.value,
                        ratingTitle: '1658',
                        context: context,
                        initialRating: 3.0,
                        ratingCallback: (rating) {},
                        index: index,
                        length: homeVM.homDailogList.length,
                        callBack: () {},
                        isFavorite: homeVM.homDailogList[index].favorite.value,
                        isFavoriteCallback: () {
                          homeVM.homDailogList[index].favorite.value =
                              !homeVM.homDailogList[index].favorite.value;
                          if (homeVM.homDailogList[index].favorite.value ==
                              true) {
                            // favoriteVM.favoriteList
                            //     .add(homeVM.homDailogList[index]);
                          } else {
                            favoriteVM.favoriteList
                                .remove(homeVM.homDailogList[index]);
                          }
                        },
                        discount: homeVM.homDailogList[index].discount,
                        title: homeVM.homDailogList[index].title,
                        subtitle: homeVM.homDailogList[index].subtitle,
                        description: homeVM.homDailogList[index].description,
                        location: homeVM.homDailogList[index].location,
                        price: homeVM.homDailogList[index].price),
                  );
                }),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                    text: 'All Services',
                    fontSize: SizeConfig.textMultiplier * 2.24,
                    textColor: AppColor.textBlack),
                Column(
                  children: List.generate(
                      4,
                      (index) => servicesTile(
                          isFavoriteCallback: () {},
                          isFavorite: isFavorite.value,
                          discount: '30',
                          ratingCallback: (value) {},
                          initialRating: 3,
                          title: 'title',
                          subtitle: 'subtitle',
                          location: 'location',
                          price: 'price',
                          imageUrl: imageURl,
                          categoriesCallback: () {})),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget titleRatingTile(
      {required String title,
      required String totalRating,
      required Function(double?)? ratingCallback,
      required double initialRating,
      required String subtitle,
      required String time}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5.0,
          vertical: SizeConfig.heightMultiplier * 1.7),
      // height: SizeConfig.heightMultiplier * 15.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor1A.withOpacity(0.15),
                offset: Offset(0, 8),
                blurRadius: 15)
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appText(
                text: title,
                textAlign: TextAlign.left,
                fontSize: SizeConfig.textMultiplier * 2.24,
                textColor: AppColor.textBlack),
            Image(
              image: AssetImage('assets/home/icons/heart.png'),
              width: SizeConfig.widthMultiplier * 7.2,
              height: SizeConfig.heightMultiplier * 3.6,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 0.65,
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
          height: SizeConfig.heightMultiplier * 0.5,
        ),
        appText(
            textAlign: TextAlign.left,
            text: subtitle,
            fontSize: SizeConfig.textMultiplier * 1.5,
            textColor: AppColor.textGrey,
            fontWeight: FontWeight.w500),
        SizedBox(
          height: SizeConfig.heightMultiplier * 0.7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.clock,
              color: AppColor.red,
              size: SizeConfig.imageSizeMultiplier * 3.2,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 1.6,
            ),
            appText(
                text: time,
                fontSize: SizeConfig.textMultiplier * 1.5,
                fontWeight: FontWeight.w500,
                textColor: AppColor.red)
          ],
        )
      ]),
    );
  }
}
