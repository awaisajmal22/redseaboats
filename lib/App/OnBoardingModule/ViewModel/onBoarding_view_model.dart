import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/OnBoardingModule/Model/onBoarding_model.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

class OnBoardingViewModel extends GetxController{
  RxInt selectedPageIndex = 0.obs;
  final pageController = PageController();
  bool get isLastPage => selectedPageIndex == onBoardingList.length - 1;

  getToNextPage(){
if(isLastPage){
  Get.offAllNamed(AppRoutes.enableLocationView);
}
else {
pageController.nextPage(duration:const Duration(milliseconds: 500), curve: Curves.easeInOutSine);
}
 }


  final onBoardingList = [
    OnBoardingModel(
      imageUrl: 'assets/onBoarding/onboard1.png',
       subtitle: 'Explore your favorite water sports around the world.', 
       title: 'Explore'
       ),
    OnBoardingModel(
      imageUrl: 'assets/onBoarding/onboard2.png',
       subtitle: 'Make your activity experience very easy & peasy.', 
       title: 'Easy Peasy'
       ),
    OnBoardingModel(
      imageUrl: 'assets/onBoarding/onboard3.png',
       subtitle: 'Enjoy your favorite water sports with your love ones.', 
       title: 'Enjoy Tour'
       ),
       
  ];
}