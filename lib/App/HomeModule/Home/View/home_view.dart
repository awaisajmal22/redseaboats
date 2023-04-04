import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/HomeModule/Home/View/Component/home_search_field.dart';
import 'package:redseaboats/App/HomeModule/Home/View/Component/interest_tile.dart';
import 'package:redseaboats/App/HomeModule/HomeDailog/View/Component/featured_Tile.dart';
import 'package:redseaboats/App/ProfileModule/Favorite/ViewModel/favroite_view_model.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/Shimmer%20Tile/shimmer_services_tile.dart';
import 'package:redseaboats/Common/Shimmer/shimmer.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';
import 'package:shimmer/shimmer.dart';

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
                    Obx(
                      ()=> SizedBox(
                        height: SizeConfig.heightMultiplier * 45,
                        child:  PageView.builder(
                          onPageChanged: (index){
                            homeVM.carouselTileSelectedIndex.value = index;
                          },
                          itemCount: homeVM.dataModel.value.banners != null ? homeVM.dataModel.value.banners!.length : 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                          return homeVM.dataModel.value.banners != null ? carouselImageTile(
                            
                            imageUrl: homeVM.dataModel.value.banners![index].photoUrl
                          ) : shimmer(Widget: shimmercarouselImageTile());
                        })) )
                    ),
                    
                    Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.widthMultiplier * 3.0, right: SizeConfig.widthMultiplier * 3.0, bottom: SizeConfig.heightMultiplier * 10.0),
                      child: Obx(
                        ()=> Column(
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
                                          homeVM.dataModel.value.banners != null ?   carouselDots(
                            length: homeVM.dataModel.value.banners!.length,
                            selectedIndex: homeVM.carouselTileSelectedIndex.value
                          )
                         : Shimmer.fromColors(child: carouselDots(), baseColor: AppColor.textGrey, highlightColor: AppColor.greyWhite,)
                          ],
                        ),
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
              Obx(
                ()=> SizedBox(
                  
                  height: SizeConfig.heightMultiplier * 11.12,
                  child:  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: homeVM.dataModel.value.featuredServices != null ? homeVM.dataModel.value.featuredServices!.length : 5,
                      itemBuilder: (context, index){
                        var data = homeVM.dataModel.value.featuredServices;
                        return homeVM.dataModel.value.featuredServices != null ? categoryTile(
                          index: index,
                          length: homeVM.dataModel.value.featuredServices!.length,
                          categoriesCallBack: (){
                          print(homeVM.dataModel.value.featuredServices![index]);
                            Get.toNamed(AppRoutes.categoriesView,
                            arguments: [
                              data[index].category.name,
                              data,
                          

                            
                            ]
                            );
                          },
                          imageUrl: data![index].category.photoUrl,
                          title: data[index].category.name
                        ) : shimmer(
                          
                          Widget: shimmercategoryTile()
                ) ;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3.3,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              child: seeAllTitleTile(
                seeAllCallBack: (){
                  print(homeVM.dataModel.value.featuredServices!.length);
                },
                title: 'Based on Interests'
              ),),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 50,
                child: Obx(
                  ()=> ListView.builder(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: homeVM.dataModel.value.featuredServices != null ? homeVM.dataModel.value.featuredServices!.length : 3,
                    itemBuilder: (context, index){
                      var data = homeVM.dataModel.value.featuredServices;
                      if(data != null ){
                      for(int i = 0; i < data[index].slots.length; i++) {
                        return  Obx(
                          ()=> interestTile(
                                              imageUrl: data[index].photoUrl,
                                              isDailogCheck: homeVM.isDailogCheck.value,
                                              ratingTitle: data[index].totalRating.toString(),
                                              context: context,
                                              initialRating: data[index].rating.toDouble(),
                                              ratingCallback: (rating){},
                                              index: index,
                                              length: homeVM.dataModel.value.featuredServices!.length,
                                              callBack: (){},
                                              isFavorite: data[index].isLiked, 
                                              isFavoriteCallback: (){
                          data[index].isLiked = !data[index].isLiked;
                          if(data[index].isLiked == true){
                            favoriteVM.favoriteList.add(data[index]);
                          }
                          else {
                            favoriteVM.favoriteList.remove(homeVM.homDailogList[index]);
                          }
                                              }, 
                                              discount: '30', 
                                              title: data[index].title, 
                                              subtitle: data[index].status, 
                                              description: data[index].description, 
                                              location: data[index].location.title, 
                                              price: data[index].slots[i].price.toString()
                                              ),
                        );
                      }
                      } else {
                        return shimmer(Widget: shimmerfeaturedTile());
                      }
                  }
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier *3.0,
              ),
              
              Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              child: seeAllTitleTile(
                seeAllCallBack: (){
                  print(homeVM.dataModel.value.nearbyServices!.length);
                },
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
                          // if(homeVM.comboPackageList[index].favorite.value == true){
                          //   favoriteVM.favoriteList.add(homeVM.comboPackageList[index]);
                          // }
                          // else {
                          //   favoriteVM.favoriteList.remove(homeVM.comboPackageList[index]);
                          // }
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
                child:  Obx(
                  ()=> ListView.builder(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                    scrollDirection: Axis.horizontal,
                    itemCount:homeVM.dataModel.value.featuredServices != null ? homeVM.dataModel.value.featuredServices!.length : 3,
                    itemBuilder: (context, index){
                      var data = homeVM.dataModel.value.featuredServices;
                      if(homeVM.dataModel.value.featuredServices != null ) {
                        for(int i = 0; i < data![index].slots.length; i++) {
                          return  homeServicesTile(
                          initialRating: data[index].ratingCount.toDouble(),
                          ratingCallback: (value){},
                          isFavoriteCallback: (){
                            data[index].isLiked = !data[index].isLiked;
                            // if(data[index].favorite.value == true){
                            //   favoriteVM.favoriteList.add(data[index]);
                            // }
                            // else{
                            //  favoriteVM.favoriteList.remove(data[index]);
                            // }
                          },
                          isFavorite: data[index].isLiked,
                          discount: '30',
                          title: data[index].title,
                          subtitle: data[index].status,
                          location: data[index].location.title,
                          price: data[index].slots[i].price.toString(),
                          imageUrl: data[index].photoUrl
                      );
                        }
                      } else {
                        return shimmer(Widget: shimmerServicesTile());
                      }
                  }),
                ),
              ),
               SizedBox(
                height: SizeConfig.heightMultiplier * 3.0,
              ),
               Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
              child: seeAllTitleTile(
                seeAllCallBack: (){
                 print(homeVM.dataModel.value.nearbyServices!.length);
                },
                title: 'Nearby Attractions'
              ),),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 22.5,
                child: Obx(
                  ()=> ListView.builder(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: homeVM.dataModel.value.nearbyServices != null ? homeVM.dataModel.value.nearbyServices!.length : 3,
                    itemBuilder: (context, index){
                      var data = homeVM.dataModel.value.nearbyServices;
                      if(homeVM.dataModel.value.nearbyServices != null) {
                        for(int i = 0; i < homeVM.dataModel.value.nearbyServices!.length; i++) {
                          return homeServicesTile(
                          initialRating: 3.0,
                          ratingCallback: (value){},
                          isFavoriteCallback: (){
                            data[index].isLiked = !data[index].isLiked;
                            // if(homeVM.homDailogList[index].favorite.value == true){
                            //   favoriteVM.favoriteList.add(data[index]);
                            // }
                            // else{
                            //   favoriteVM.favoriteList.remove(data[index]);
                            // }
                            print(homeVM.dataModel.value.nearbyServices!.length);
                          },
                          isFavorite: data![index].isLiked,
                          discount: '30',
                          title: data[index].title,
                          subtitle: data[index].status,
                          location: data[index].location.streetAddress,
                          price: data[index].slots[i].price.toString(),
                          imageUrl: data[index].photoUrl
                        );
                        }
                      } else {
                        return shimmer(Widget: shimmerServicesTile());
                      }
                  }),
                ),
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