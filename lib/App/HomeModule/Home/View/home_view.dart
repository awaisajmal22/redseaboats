import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/HomeModule/Home/View/Component/home_search_field.dart';
import 'package:redseaboats/App/HomeModule/Home/View/Component/interest_tile.dart';
import 'package:redseaboats/App/ProfileModule/Favorite/ViewModel/favroite_view_model.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import '../ViewModel/home_view_model.dart';
import 'Component/adrenaline_meter_dialog.dart';
import 'Component/carousel_dot.dart';
import 'Component/carousel_image_tile.dart';
import 'Component/categories_tile.dart';
import 'Component/home_appbar.dart';
import 'Component/home_services_tile.dart';
import 'Component/offer_tile.dart';
import 'Component/seeall_title_tile.dart';
import 'Component/title_tile.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
final homeVM = Get.find<HomeViewModel>();
final favoriteVM = Get.find<FavoriteViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 0,bottom: 30,),
            children: [
              Container(
                color: Colors.white,
                height: SizeConfig.heightMultiplier * 49,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 45,
                      child: PageView.builder(
                        onPageChanged: (index){
                          homeVM.carouselTileSelectedIndex.value = index;
                        },
                        itemCount: homeVM.carouselImageList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                        return carouselImageTile(
                          
                          imageUrl: homeVM.carouselImageList[index]
                        );
                      })),
                    ),
                    
                    Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.widthMultiplier * 3.0, right: SizeConfig.widthMultiplier * 3.0, bottom: SizeConfig.heightMultiplier * 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          homeAppBar(
                            membershipCallback: (){
                              Get.toNamed(AppRoutes.membershipView);
                            },
                            notificationCallback: (){
                              Get.toNamed(AppRoutes.notificationView);
                            },
                        title: 'Current Location'
                      ),
                      Obx(
                        ()=> carouselDots(
                          length: homeVM.carouselImageList.length,
                          selectedIndex: homeVM.carouselTileSelectedIndex.value
                        ),
                      )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: SizeConfig.widthMultiplier* 5.0,
                      right: SizeConfig.widthMultiplier * 5.0,
                      child: homeSearchField(
                        searchCallback: (){
                          if(homeVM.searchController.text != ''){
                          homeVM.searchList.add(homeVM.searchController.text);

                          }
                          Get.toNamed(AppRoutes.SearchView);
                        },
                        controller: homeVM.searchController,
                        filterCallBack: (){
                          Get.toNamed(AppRoutes.filterView);
                        },
                        hintText: 'Search Here'
                      )
                      )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3.0,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
                child: titleTile(
                  title: 'Categories'
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              SizedBox(
                
                height: SizeConfig.heightMultiplier * 11.12,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeVM.categoriesList.length,
                  itemBuilder: (context, index){
                    return categoryTile(
                      index: index,
                      length: homeVM.categoriesList.length,
                      categoriesCallBack: (){
                        Get.toNamed(AppRoutes.categoriesView,
                        arguments: [
                          homeVM.categoriesList[index].title,
                          homeVM.categoriesList[index].categories
                        ]
                        );
                      },
                      imageUrl: homeVM.categoriesList[index].imageUrl,
                      title: homeVM.categoriesList[index].title
                    );
                }),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3.3,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              child: seeAllTitleTile(
                seeAllCallBack: (){},
                title: 'Based on Interests'
              ),),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 50,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeVM.homDailogList.length,
                  itemBuilder: (context, index){
                return Obx(
                  ()=> interestTile(
                    imageUrl: homeVM.homDailogList[index].imageUrl,
                    isDailogCheck: homeVM.isDailogCheck.value,
                    ratingTitle: '1658',
                    context: context,
                    initialRating: 3.0,
                    ratingCallback: (rating){},
                    index: index,
                    length: homeVM.homDailogList.length,
                    callBack: (){},
                    isFavorite: homeVM.homDailogList[index].favorite.value, 
                    isFavoriteCallback: (){
                      homeVM.homDailogList[index].favorite.value = !homeVM.homDailogList[index].favorite.value;
                      if(homeVM.homDailogList[index].favorite.value == true){
                        favoriteVM.favoriteList.add(homeVM.homDailogList[index]);
                      }
                      else {
                        favoriteVM.favoriteList.remove(homeVM.homDailogList[index]);
                      }
                    }, 
                    discount: homeVM.homDailogList[index].discount, 
                    title: homeVM.homDailogList[index].title, 
                    subtitle: homeVM.homDailogList[index].subtitle, 
                    description: homeVM.homDailogList[index].description, 
                    location: homeVM.homDailogList[index].location, 
                    price: homeVM.homDailogList[index].price
                    ),
                );
                }),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier *3.0,
              ),
              Padding(
                padding: EdgeInsets.only(left:  SizeConfig.widthMultiplier * 5.0),
                child: titleTile(title: 'Discount Offers'),
              ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 11,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                    itemCount:  homeVM.offerList.length,
                    itemBuilder: (context, index){
                      return offersTile(
                        index: index,
                        length: homeVM.offerList.length,
                        imageUrl: homeVM.offerList[index]
                        );
                  }),
                ),
                SizedBox(
                height: SizeConfig.heightMultiplier *3.0,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              child: seeAllTitleTile(
                seeAllCallBack: (){},
                title: 'Combo Packages'
              ),),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 22.5,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeVM.comboPackageList.length,
                  itemBuilder: (context, index){
                    return Obx(
                      ()=> homeServicesTile(
                        initialRating: 3.0,
                        ratingCallback: (value){},
                        isFavoriteCallback: (){
                          homeVM.comboPackageList[index].favorite.value = !homeVM.comboPackageList[index].favorite.value;
                          if(homeVM.comboPackageList[index].favorite.value == true){
                            favoriteVM.favoriteList.add(homeVM.comboPackageList[index]);
                          }
                          else {
                            favoriteVM.favoriteList.remove(homeVM.comboPackageList[index]);
                          }
                        },
                        isFavorite: homeVM.comboPackageList[index].favorite.value,
                        discount: homeVM.comboPackageList[index].discount,
                        title: homeVM.comboPackageList[index].title,
                        subtitle: homeVM.comboPackageList[index].subtitle,
                        location: homeVM.comboPackageList[index].location,
                        price: homeVM.comboPackageList[index].price,
                        imageUrl: homeVM.comboPackageList[index].imageUrl
                      ),
                    );
                }),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3.0,
              ),
               Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              child: seeAllTitleTile(
                seeAllCallBack: (){},
                title: 'Featured Services'
              ),),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 22.5,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeVM.featuredList.length,
                  itemBuilder: (context, index){
                    return Obx(
                      ()=> homeServicesTile(
                        initialRating: 3.0,
                        ratingCallback: (value){},
                        isFavoriteCallback: (){
                          homeVM.featuredList[index].favorite.value = !homeVM.featuredList[index].favorite.value;
                          if(homeVM.featuredList[index].favorite.value == true){
                            favoriteVM.favoriteList.add(homeVM.featuredList[index]);
                          }
                          else{
                           favoriteVM.favoriteList.remove(homeVM.featuredList[index]);
                          }
                        },
                        isFavorite: homeVM.featuredList[index].favorite.value,
                        discount: homeVM.featuredList[index].discount,
                        title: homeVM.featuredList[index].title,
                        subtitle: homeVM.featuredList[index].subtitle,
                        location: homeVM.featuredList[index].location,
                        price: homeVM.featuredList[index].price,
                        imageUrl: homeVM.featuredList[index].imageUrl
                      ),
                    );
                }),
              ),
               SizedBox(
                height: SizeConfig.heightMultiplier * 3.0,
              ),
               Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              child: seeAllTitleTile(
                seeAllCallBack: (){},
                title: 'Nearby Attractions'
              ),),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 22.5,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeVM.nearByList.length,
                  itemBuilder: (context, index){
                    return Obx(
                      ()=> homeServicesTile(
                        initialRating: 3.0,
                        ratingCallback: (value){},
                        isFavoriteCallback: (){
                          homeVM.nearByList[index].favorite.value = !homeVM.nearByList[index].favorite.value;
                          if(homeVM.homDailogList[index].favorite.value == true){
                            favoriteVM.favoriteList.add(homeVM.nearByList[index]);
                          }
                          else{
                            favoriteVM.favoriteList.remove(homeVM.nearByList[index]);
                          }
                          print(favoriteVM.favoriteList.length);
                        },
                        isFavorite: homeVM.nearByList[index].favorite.value,
                        discount: homeVM.nearByList[index].discount,
                        title: homeVM.nearByList[index].title,
                        subtitle: homeVM.nearByList[index].subtitle,
                        location: homeVM.nearByList[index].location,
                        price: homeVM.nearByList[index].price,
                        imageUrl: homeVM.nearByList[index].imageUrl
                      ),
                    );
                }),
              ),
            ],
          ),
          Positioned(
            top: SizeConfig.heightMultiplier * 33,
            child: Obx(
                  ()=>  homeVM.isShowAderlineMeter.value == true ? adrenalineMeterDailog() : SizedBox.shrink()
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(right: SizeConfig.widthMultiplier * 0.8),
        child: AnimatedBuilder(
        
          animation: homeVM.animation!,
          child: GestureDetector(
            onTap: (){
             homeVM.isShowAderlineMeter.value = !homeVM.isShowAderlineMeter.value;
              homeVM.isDailogCheck.value = !homeVM.isDailogCheck.value;
              homeVM.rotateContainer(360);
              homeVM.animationController!.forward(from: 0);
            },
            child: Image(image: AssetImage('assets/home/icons/float.png'), fit: BoxFit.cover, width:  SizeConfig.widthMultiplier * 12.4, height: SizeConfig.heightMultiplier * 6.4,)
          ),
          builder: (context, child) {
            
            return Transform.rotate(
              
              angle: homeVM.animation!.value, child: child,
              );
          },
        ),
      ),
      
    );
  }

 
}