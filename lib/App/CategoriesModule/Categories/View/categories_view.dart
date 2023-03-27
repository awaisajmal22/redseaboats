import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/CategoriesModule/Categories/View/Component/categories_appbar.dart';
import 'package:redseaboats/App/CategoriesModule/Categories/View/Component/categories_tile.dart';
import 'package:redseaboats/App/HomeModule/Home/ViewModel/home_view_model.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});
  var title = Get.arguments[0];
  var modelList = Get.arguments[1];
  final homeVM = Get.find<HomeViewModel>();
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
          return Obx(
            ()=> categoriesTile(
              categoriesCallback: (){
                Get.toNamed(AppRoutes.categoriesDetailView, 
                arguments: [
                  modelList[index].imageUrl,
                  modelList[index].favorite
                ]
                );
                print(modelList.length);
              },
              isFavoriteCallback: (){
                modelList[index].favorite.value = !modelList[index].favorite.value;
            }, 
            isFavorite: modelList[index].favorite.value, 
            discount: modelList[index].discount, 
            ratingCallback: (value){}, 
            initialRating: 3, 
            title: modelList[index].title, 
            subtitle: modelList[index].subtitle, 
            location: modelList[index].location, 
            price: modelList[index].price, 
            imageUrl: modelList[index].imageUrl),
          );
      }),
    );
  }
}