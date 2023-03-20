

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/HomeModule/HomeDailog/Model/home_dialog_model.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';

import '../../HomeDailog/View/home_dailog_view.dart';
import '../Model/category_model.dart';

class HomeViewModel extends GetxController with GetTickerProviderStateMixin{
  final searchController = TextEditingController();
  RxInt carouselTileSelectedIndex = 0.obs;
  RxBool isShowAderlineMeter = false.obs;
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
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    rotateContainer(90);
  }
  
Animation<double>? animation;
AnimationController? animationController;
  rotateContainer(int degree){
   final angle = degree * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(animationController!);
  }

@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    animationController!.dispose();
  }

List offerList = [
  'assets/home/offers/Offer1.png',
  'assets/home/offers/offer2.png',
];
  RxList<HomeDialogModel> homDailogList = <HomeDialogModel>[
    HomeDialogModel(
      imageUrl: 'https://cdn.pixabay.com/photo/2016/11/06/05/36/lake-1802337__340.jpg',
      title: 'Dhow Cruise', 
      discount: '50',
      subtitle: 'Dubai Water Sports', 
      description: "Portugal there's so much more to discover. Read about the Azores...", 
      location: 'Marina, Dubai', 
      price: 'AED 420/hr', 
      favorite: false.obs
      ),
    HomeDialogModel(
      imageUrl: 'https://cdn.pixabay.com/photo/2018/01/22/14/13/animal-3099035__340.jpg',
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