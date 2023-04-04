import 'package:get/get.dart';
import 'package:redseaboats/App/HomeModule/Home/Model/home_model.dart';
import 'package:redseaboats/App/HomeModule/HomeDailog/Model/home_model.dart';

class FavoriteViewModel extends GetxController{
  RxList<FeaturedService> favoriteList = <FeaturedService>[].obs;
}