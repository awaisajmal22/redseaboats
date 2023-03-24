import 'package:get/get.dart';
import 'package:redseaboats/App/HomeModule/HomeDailog/Model/home_model.dart';

class FavoriteViewModel extends GetxController{
  RxList<HomeModel> favoriteList = <HomeModel>[].obs;
}