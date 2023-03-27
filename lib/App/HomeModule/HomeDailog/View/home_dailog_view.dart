import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

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
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 50,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 7.5),
                            itemCount: homeVM.homDailogList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                            return Obx(
                              ()=> featuredTile(
                                imageUrl: homeVM.homDailogList[index].imageUrl,
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
                        )
                      ],
                    ),
                  ),
                   Positioned(
                  right: 0, top: 0,
                  child: GestureDetector(
                    onTap: (){
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

