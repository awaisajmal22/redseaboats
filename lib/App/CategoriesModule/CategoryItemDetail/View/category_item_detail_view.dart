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
import 'component/title_rating_tile.dart';

class CategoryItemDetailView extends StatelessWidget {
  CategoryItemDetailView({super.key});
  final homeVM = Get.find<HomeViewModel>();
  final favoriteVM = Get.find<FavoriteViewModel>();
  var data = Get.arguments[0];
  var moreSellData = Get.arguments[1];

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
                    imageUrl: data.photoUrl, chatCallback: () {}),
                Positioned(
                    bottom: 0,
                    left: SizeConfig.widthMultiplier * 5.0,
                    right: SizeConfig.widthMultiplier * 5.0,
                    child: titleRatingTile(
                        time:
                            "${data.timings[0].min} to ${data.timings[0].max} | Sun - Sat",
                        subtitle: data.location.streetAddress,
                        initialRating: data.rating.toDouble(),
                        ratingCallback: (value) {},
                        totalRating: data.ratingCount.toString(),
                        title: data.location.title))
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
                itemCount: moreSellData.length,
                itemBuilder: (context, index) {
                  for (int i = 0; i < moreSellData[index].slots.length; i++) {
                    return Obx(
                      () => interestTile(
                          imageUrl: moreSellData[index].photoUrl,
                          isDailogCheck: homeVM.isDailogCheck.value,
                          ratingTitle: '1658',
                          context: context,
                          initialRating: 3.0,
                          ratingCallback: (rating) {},
                          index: index,
                          length: moreSellData.length,
                          callBack: () {},
                          isFavorite: moreSellData[index].isLiked,
                          isFavoriteCallback: () {
                            moreSellData[index].isLiked =
                                !moreSellData[index].isLiked;
                            if (moreSellData[index].isLiked == true) {
                              // favoriteVM.favoriteList
                              //     .add(moreSellData[index]);
                            } else {
                              favoriteVM.favoriteList
                                  .remove(moreSellData[index]);
                            }
                          },
                          discount: moreSellData[index]
                              .slots[i]
                              .discount
                              .discountPercentage
                              .toString(),
                          title: moreSellData[index].title,
                          subtitle: moreSellData[index].location.title,
                          description: moreSellData[index].description,
                          location: moreSellData[index].location.streetAddress,
                          price: moreSellData[index].slots[i].price.toString()),
                    );
                  }
                }),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
            child: appText(
              textAlign: TextAlign.left,
                text: 'All Services',
                fontSize: SizeConfig.textMultiplier * 2.24,
                textColor: AppColor.textBlack),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              itemCount: moreSellData.length,
              itemBuilder: (contex, index) {
                var allserviceData = moreSellData[index];
                for(int i = 0; i< moreSellData[index].slots.length; i++) {
                  return servicesTile(
                    isFavoriteCallback: () {},
                    isFavorite: allserviceData.isLiked,
                    discount: allserviceData.slots[i].discount.discountPercentage.toString(),
                    ratingCallback: (value) {},
                    initialRating: 3,
                    title: allserviceData.title,
                    subtitle: allserviceData.location.title,
                    location: allserviceData.location.streetAddress,
                    price: 'price',
                    imageUrl: allserviceData.photoUrl,
                    categoriesCallback: () {});
                }
              
              }),
          )
        ],
      ),
    );
  }
}
