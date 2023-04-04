import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/ProfileModule/Favorite/View/Component/favorite_tile.dart';
import 'package:redseaboats/App/ProfileModule/Favorite/ViewModel/favroite_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

class FavoriteView extends StatelessWidget {
   FavoriteView({super.key});
   final favoriteVM = Get.find<FavoriteViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'My Favroites'),
      body: favoriteVM.favoriteList.isEmpty ? const SizedBox.shrink() : ListView.builder(
        itemCount: favoriteVM.favoriteList.length,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
        itemBuilder: (context, oldIndex) {
         final  index = (favoriteVM.favoriteList.length - 1) - oldIndex;
         for(int i = 0; i < favoriteVM.favoriteList[index].slots.length; i++) {
           return Obx(
          ()=> favoriteTile(
            isFavoriteCallback: (){
              
            }, isFavorite: favoriteVM.favoriteList[index].isLiked, 
            discount: '50', 
            ratingCallback: (value){} ,
            initialRating: favoriteVM.favoriteList[index].ratingCount.toDouble(), 
            title: favoriteVM.favoriteList[index].title, 
            subtitle: favoriteVM.favoriteList[index].status, 
            location: favoriteVM.favoriteList[index].location.title, 
            price: favoriteVM.favoriteList[index].slots[i].price.toString(), 
            imageUrl: favoriteVM.favoriteList[index].photoUrl
            ),
        );
         }
      }),
    );
  }
}