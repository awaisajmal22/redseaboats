import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/CategoriesModule/Categories/View/Component/categories_appbar.dart';
import 'package:redseaboats/App/CategoriesModule/Categories/View/Component/categories_tile.dart';
import 'package:redseaboats/App/CategoriesModule/Categories/ViewModel/categories_view_model.dart';
import 'package:redseaboats/App/HomeModule/Home/ViewModel/home_view_model.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});
  final categoryVM = Get.find<CategoriesViewModel>();
  var title = Get.arguments[0];
  var modelList = Get.arguments[1];
  var moreSellData = Get.arguments[2];
  final homeVM = Get.find<CategoriesViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoriesAppBar(title: title, filterCallback: (){
        Get.toNamed(AppRoutes.filterView);

      }),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0,vertical: SizeConfig.heightMultiplier * 3.0),
        itemCount: modelList.length,
        itemBuilder: (context, index){
        
          for(int i =0; i < modelList[index].slots.length; i++) {
           
            return  categoriesTile(
              categoriesCallback: (){
                
                print(categoryVM.categoryDataList.length);
                Get.toNamed(AppRoutes.categoriesDetailView, 
                arguments: [
                  modelList[index],
                  modelList[index].slots[i],
                  moreSellData
                ]
                );
                print(modelList.length);
              },
              isFavoriteCallback: (){
                modelList[index].isLiked = !modelList[index].isLiked;
            }, 
            isFavorite: modelList[index].isLiked, 
            discount: '30', 
            ratingCallback: (value){}, 
            initialRating: modelList[index].ratingCount.toDouble(), 
            title: modelList[index].title, 
            subtitle: modelList[index].location.title, 
            location: modelList[index].location.streetAddress, 
            price: modelList[index].slots[i].price.toString(), 
            imageUrl: modelList[index].photoUrl
          );
          }
      }),
    );
  }
}