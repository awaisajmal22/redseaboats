import 'package:get/get.dart';
import 'package:redseaboats/App/EnableLocationModule/View/enable_location_view.dart';
import 'package:redseaboats/App/InterestModule/View/interest_view.dart';
import 'package:redseaboats/App/InterestModule/ViewModel/interest_view_model.dart';
import 'package:redseaboats/App/OnBoardingModule/View/onboarding_view.dart';
import 'package:redseaboats/App/OnBoardingModule/ViewModel/onBoarding_view_model.dart';
import 'package:redseaboats/App/SplashModule/View/splash_view.dart';
import 'package:redseaboats/App/SplashModule/ViewModel/splash_view_model.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

class AppPages{
  static final routes = [
    GetPage(
      name: AppRoutes.splashView,
      transition: Transition.rightToLeft,
      page: ()=> SplashView(),
      
      binding: BindingsBuilder((){
        Get.lazyPut(() => SplashViewModel());
      })
    ),
    GetPage(
      name: AppRoutes.onBoardingView, 
      page: ()=> OnBoardingView(),
      transition: Transition.rightToLeft,
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
      transition: Transition.rightToLeft,
      binding: BindingsBuilder(() {
        Get.lazyPut(() => InterestViewModel());
      })
      )
  ];
}