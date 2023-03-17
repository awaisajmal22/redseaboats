import 'package:get/get.dart';
import 'package:redseaboats/App/BottomNavBarModule/View/navBar_view.dart';

import 'package:redseaboats/App/EnableLocationModule/View/enable_location_view.dart';
import 'package:redseaboats/App/HomeModule/HomeDailog/View/home_dailog_view.dart';
import 'package:redseaboats/App/HomeModule/Home/View/home_view.dart';
import 'package:redseaboats/App/HomeModule/Home/ViewModel/home_view_model.dart';
import 'package:redseaboats/App/OnBoardingModule/View/onboarding_view.dart';
import 'package:redseaboats/App/OnBoardingModule/ViewModel/onBoarding_view_model.dart';
import 'package:redseaboats/App/SplashModule/View/splash_view.dart';
import 'package:redseaboats/App/SplashModule/ViewModel/splash_view_model.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import '../App/BottomNavBarModule/ViewModel/navBar_view_model.dart';
import '../App/InterestModule/View/interest_view.dart';
import '../App/InterestModule/ViewModel/interest_view_model.dart';

class AppPages{
  static final routes = [
    GetPage(
      name: AppRoutes.splashView,
      transition: Transition.fade,
      page: ()=> SplashView(),
      
      binding: BindingsBuilder((){
        Get.lazyPut(() => SplashViewModel());
      })
    ),
    GetPage(
      name: AppRoutes.onBoardingView, 
      page: ()=> OnBoardingView(),
      transition: Transition.fade,
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnBoardingViewModel());
      })
      ),
      GetPage(
      name: AppRoutes.enableLocationView, 
      page: ()=> const EnableLocationView(),
      transition: Transition.rightToLeft,
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnBoardingViewModel());
      })
      ),
      GetPage(
      name: AppRoutes.interestView, 
      page: ()=>  InterestView(),
      transition: Transition.fade,
      binding: BindingsBuilder(() {
        Get.lazyPut(() => InterestViewModel());
      })
      ),
     
        GetPage(
        name: AppRoutes.homedialog, 
        page: ()=> HomeDialog(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeViewModel());
        })),
        GetPage(
        name: AppRoutes.homeView, 
        page: ()=> NavBarView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => NavBarViewModel());
          Get.lazyPut(() => HomeViewModel());
        })),
        
         GetPage(
      name: AppRoutes.navBar, 
      page: ()=>  NavBarView(),
      transition: Transition.fade,
      
      ),
  ];
}