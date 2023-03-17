

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/HomeModule/HomeDailog/Model/home_dialog_model.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';

import '../../HomeDailog/View/home_dailog_view.dart';
import '../Model/category_model.dart';

class HomeViewModel extends GetxController{
  final searchController = TextEditingController();
  RxInt carouselTileSelectedIndex = 0.obs;
  List carouselImageList = [
    'https://images.pexels.com/photos/15686039/pexels-photo-15686039.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
    'https://images.pexels.com/photos/7384875/pexels-photo-7384875.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
    'https://images.pexels.com/photos/10821197/pexels-photo-10821197.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
  ];
 
RxBool isDailogCheck = false.obs;
  List<CategoriesModel> categoriesList = <CategoriesModel>[
    CategoriesModel(imageUrl: 'https://images.pexels.com/photos/15836010/pexels-photo-15836010.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load', title: 'Jet Skiing'),
    CategoriesModel(imageUrl: 'https://images.pexels.com/photos/6913372/pexels-photo-6913372.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load', title: 'Dhow Cruise'),
    CategoriesModel(imageUrl: 'https://images.pexels.com/photos/15798715/pexels-photo-15798715.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load', title: 'Kite Surfing'),
    CategoriesModel(imageUrl: 'https://images.pexels.com/photos/10347606/pexels-photo-10347606.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load', title: 'Water Ski'),
    CategoriesModel(imageUrl: 'https://images.pexels.com/photos/15572216/pexels-photo-15572216.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load', title: 'Flyboarding'),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      showDialog(
        barrierDismissible: false,
        context: Get.overlayContext!, builder: (_){
          return HomeDialog();
      });
    //  Get.defaultDialog(
    //   backgroundColor: AppColor.transparent,
      
    //   title: '',
    //   content: 
    //  );
    });
  }
List offerList = [
  'assets/home/offers/Offer1.png',
  'assets/home/offers/offer2.png',
];
  RxList<HomeDialogModel> homDailogList = <HomeDialogModel>[
    HomeDialogModel(
      title: 'Dhow Cruise', 
      discount: '50',
      subtitle: 'Dubai Water Sports', 
      description: "Portugal there's so much more to discover. Read about the Azores...", 
      location: 'Marina, Dubai', 
      price: 'AED 420/hr', 
      favorite: false.obs
      ),
    HomeDialogModel(
      title: 'Dhow Cruise', 
      discount: '50',
      subtitle: 'Dubai Water Sports', 
      description: "Portugal there's so much more to discover. Read about the Azores...", 
      location: 'Marina, Dubai', 
      price: 'AED 420/hr', 
      favorite: false.obs
      ),
  ].obs;
}