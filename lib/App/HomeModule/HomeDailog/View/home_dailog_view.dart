import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../Common/Shimmer/shimmer.dart';
import '../../../ProfileModule/Favorite/ViewModel/favroite_view_model.dart';
import '../../Home/ViewModel/home_view_model.dart';
import 'Component/featured_Tile.dart';


class HomeDialog extends StatelessWidget {
   HomeDialog({super.key});
final homeVM = Get.find<HomeViewModel>();
final favoriteVM = Get.find<FavoriteViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.transparent,
        body: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: SizedBox(
            height: SizeConfig.heightMultiplier  * 60.3,
            width: SizeConfig.widthMultiplier * 95,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
               
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(14)
                    ),
                  
                    height: SizeConfig.heightMultiplier * 58.5,
                    width: SizeConfig.widthMultiplier * 90,
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2.0,
                        ),
                        appText(text: 'Featured Services', textColor: AppColor.textBlack, fontSize: 18),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2.0,
                        ),
                        Obx(
                          ()=> SizedBox(
                            height: SizeConfig.heightMultiplier * 50,
                            child:  ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 7.5),
                              itemCount: homeVM.dataModel.value.featuredServices  != null ? homeVM.dataModel.value.featuredServices!.length : 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                                var data =  homeVM.dataModel.value.featuredServices;
                              if(homeVM.dataModel.value.featuredServices  != null){  for(int i = 0; i < homeVM.dataModel.value.featuredServices![index].slots.length; i++) {
                                  return featuredTile(
                                  imageUrl: data![index].photoUrl,
                          ratingTitle: data[index].totalRating.toString(),
                          context: context,
                          initialRating: data[index].ratingCount.toDouble(),
                          ratingCallback: (rating){},
                          index: index,
                          length: data.length,
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
                          title:data[index].title, 
                          subtitle: data[index].status, 
                          description: data[index].description, 
                          location: data[index].location.title, 
                          price: data[index].slots[i].price.toString()
                          );
                                }
                                
                              } else {
                                return shimmer(
                            Widget: shimmerfeaturedTile()
                          );
                              }
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                   Positioned(
                  right: 0, top: 0,
                  child: GestureDetector(
                    onTap: (){
                      if(homeVM.dataModel.value != null) {
                        print(homeVM.dataModel.value.banners);
                      }
                      Get.back();
                      homeVM.isDailogCheck.value = true;
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/home/icons/close.png'), fit: BoxFit.cover)
                      ), 
                    ),
                  )
                  ),
              ],
            ),
            ),
          ),
        ),
      
    );
  }
}

