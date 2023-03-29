import 'package:get/get.dart';
import 'package:redseaboats/App/AuthModule/Signup/View/signup_view.dart';
import 'package:redseaboats/App/AuthModule/Signup/ViewModel/signup_view_model.dart';
import 'package:redseaboats/App/BookingModule/Booking/View/booking_view.dart';
import 'package:redseaboats/App/BookingModule/Booking/ViewModel/booking_view_model.dart';
import 'package:redseaboats/App/BookingModule/BookingDateTime/View/booking_date_time_view.dart';
import 'package:redseaboats/App/BookingModule/BookingDateTime/ViewModel/booking_date_time_view_model.dart';
import 'package:redseaboats/App/BookingModule/BookingReview/View/booking_review_view.dart';
import 'package:redseaboats/App/BookingModule/BookingStarReview/View/Booking_star_review_view.dart';
import 'package:redseaboats/App/BookingModule/Complaint/View/complaint_view.dart';
import 'package:redseaboats/App/BookingModule/CancelBookingDialog/View/cancel_booking_dailog.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/View/booking_detail_view.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/ViewModel/booking_detail_view_model.dart';
import 'package:redseaboats/App/BookingModule/Complaint/ViewModel/complaint_view_model.dart';
import 'package:redseaboats/App/BottomNavBarModule/View/navBar_view.dart';
import 'package:redseaboats/App/CategoriesModule/Categories/View/categories_view.dart';
import 'package:redseaboats/App/CategoriesModule/Categories/ViewModel/categories_view_model.dart';
import 'package:redseaboats/App/CategoriesModule/CategoriesDetail/View/categories_detail_view.dart';
import 'package:redseaboats/App/CategoriesModule/CategoriesDetail/ViewModel/categories_detail_view_model.dart';
import 'package:redseaboats/App/CategoriesModule/CategoryItemDetail/View/category_item_detail_view.dart';
import 'package:redseaboats/App/ChatModule/SingleUserChat/View/single_user_chat_view.dart';
import 'package:redseaboats/App/ChatModule/SingleUserChat/ViewModel/single_user_chat_view_model.dart';
import 'package:redseaboats/App/ChatModule/WholeChat/ViewModel/chat_view_model.dart';

import 'package:redseaboats/App/EnableLocationModule/View/enable_location_view.dart';
import 'package:redseaboats/App/HomeModule/HomeDailog/View/home_dailog_view.dart';
import 'package:redseaboats/App/HomeModule/Home/View/home_view.dart';
import 'package:redseaboats/App/HomeModule/Home/ViewModel/home_view_model.dart';
import 'package:redseaboats/App/MembershipModule/Membership/ViewModel/membership_view_model.dart';
import 'package:redseaboats/App/NotificationModule/View/notification_view.dart';
import 'package:redseaboats/App/NotificationModule/ViewModel/notification_view_model.dart';
import 'package:redseaboats/App/OnBoardingModule/View/onboarding_view.dart';
import 'package:redseaboats/App/OnBoardingModule/ViewModel/onBoarding_view_model.dart';
import 'package:redseaboats/App/PasswordModule/ChangePassword/View/change_password_view.dart';
import 'package:redseaboats/App/PaymentModule/AfterPayment/View/after_payment_view.dart';
import 'package:redseaboats/App/PaymentModule/PaymentDetail/View/payment_detail_view.dart';
import 'package:redseaboats/App/PaymentModule/PaymentMethod/View/payment_method_view.dart';
import 'package:redseaboats/App/PaymentModule/PaymentMethod/ViewModel/payment_method_view_model.dart';
import 'package:redseaboats/App/ProfileModule/EditProfile/View/edit_profile_view.dart';
import 'package:redseaboats/App/ProfileModule/EditProfile/ViewModel/edit_profile_view_model.dart';
import 'package:redseaboats/App/ProfileModule/Favorite/View/favorite_view.dart';
import 'package:redseaboats/App/ProfileModule/Favorite/ViewModel/favroite_view_model.dart';
import 'package:redseaboats/App/MembershipModule/Membership/View/membership_view.dart';
import 'package:redseaboats/App/ProfileModule/MyWallet/View/mywallet_view.dart';
import 'package:redseaboats/App/ProfileModule/MyWallet/ViewModel/mywallet_view_model.dart';
import 'package:redseaboats/App/SearchModule/Filter/View/filter_view.dart';
import 'package:redseaboats/App/SearchModule/Filter/ViewModel/filter_view_model.dart';
import 'package:redseaboats/App/SearchModule/Search/View/search_view.dart';
import 'package:redseaboats/App/SettingsModule/About/View/about_us_view.dart';
import 'package:redseaboats/App/SettingsModule/PrivacyPolicy/View/privacy_policy_view.dart';
import 'package:redseaboats/App/SettingsModule/Settings/View/setting_view.dart';
import 'package:redseaboats/App/SettingsModule/Settings/ViewModel/settings_view_model.dart';
import 'package:redseaboats/App/SettingsModule/TermsAndPolicies/View/terms_policies_view.dart';
import 'package:redseaboats/App/SplashModule/View/splash_view.dart';
import 'package:redseaboats/App/SplashModule/ViewModel/splash_view_model.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import '../App/AuthModule/Login/View/login_view.dart';
import '../App/AuthModule/Login/ViewModel/login_view_model.dart';
import '../App/BottomNavBarModule/ViewModel/navBar_view_model.dart';
import '../App/InterestModule/View/interest_view.dart';
import '../App/InterestModule/ViewModel/interest_view_model.dart';
import '../App/MembershipModule/MembershipDetail/View/membership_detail_view.dart';
import '../App/MembershipModule/MembershipDetail/ViewModel/membership_detail_view_model.dart';
import '../App/PaymentModule/PaymentDetail/ViewModel/payment_detail_view_model.dart';

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
          Get.lazyPut(() => BookingViewModel());
          Get.lazyPut(() => ChatViewModel());
          Get.lazyPut(() => FavoriteViewModel());
        })),
        
         GetPage(
      name: AppRoutes.navBar, 
      page: ()=>  NavBarView(),
      transition: Transition.fade,
      
      ),
     GetPage(
        name: AppRoutes.editProfileView, 
        page: ()=>  EditProfileView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => EditProfileViewModel());
        })),
        GetPage(
        name: AppRoutes.myWalletView, 
        page: ()=>  MyWalletView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MyWalletViewModel());
        })),
        GetPage(
        name: AppRoutes.favoriteView, 
        page: ()=>  FavoriteView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => FavoriteViewModel());
        })),
        GetPage(
        name: AppRoutes.membershipView, 
        page: ()=>  const MembershipView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() =>  MembershipViewModel());
        })),
        GetPage(
        name: AppRoutes.membershipDetailView, 
        page: ()=>  MembershipDetailView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MembershipDetailViewModel());
        })),
         GetPage(
        name: AppRoutes.settingsView, 
        page: ()=>  SettingsView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SettingsViewModel());
        })),
        GetPage(
        name: AppRoutes.aboutUsView, 
        page: ()=>   AboutUsView(),
        transition: Transition.fade,
       ),
        GetPage(
        name: AppRoutes.termsandPoliciesView, 
        page: ()=>   TermsAndPoliciesView(),
        transition: Transition.fade,
       ),
       GetPage(
        name: AppRoutes.privacyPolicyView, 
        page: ()=>   PrivacyPolicyView(),
        transition: Transition.fade,
       ),
       GetPage(
        name: AppRoutes.changePasswordView, 
        page: ()=>   ChangePasswordView(),
        transition: Transition.fade,
       ),
       GetPage(
        name: AppRoutes.singleUserChatView, 
        page: ()=>  SingleUserChatView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SingleUserChatViewModel());
        })),
        GetPage(
        name: AppRoutes.bookingDetailView, 
        page: ()=>  BookingDetailView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => BookingDetailViewModel());
        })),
        GetPage(
        name: AppRoutes.cancelBookingDailog, 
        page: ()=>  CancelBookingDailog(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => BookingDetailViewModel());
        })),
        GetPage(
        name: AppRoutes.complaintView, 
        page: ()=>  ComplaintView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ComplaintViewModel());
        })),
        GetPage(
        name: AppRoutes.SearchView, 
        page: ()=>  SearchView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeViewModel());
        })),
        GetPage(
        name: AppRoutes.filterView, 
        page: ()=>  FilterView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => FilterViewModel());
        })),
         GetPage(
        name: AppRoutes.categoriesView, 
        page: ()=>  CategoriesView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeViewModel());
        })),
         GetPage(
        name: AppRoutes.categoriesDetailView, 
        page: ()=>  CategoriesDetailView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeViewModel());
          Get.lazyPut(() => CategoriesDetailViewModel());
        })),
         GetPage(
        name: AppRoutes.bookingDateTimeView, 
        page: ()=>  BookingDateTimeView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => BookingDateTimeViewModel());
          Get.lazyPut(() => HomeViewModel());
        })),
         GetPage(
        name: AppRoutes.bookingReview, 
        page: ()=>  BookingReviewView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
        })),
         GetPage(
        name: AppRoutes.paymentMethodView, 
        page: ()=> PaymentMehtodView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => PaymentMethodViewModel());
        })),

        GetPage(
        name: AppRoutes.paymentDetailView, 
        page: ()=> PaymentDetailView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => PaymentDetailViewModel());
        })),
        GetPage(
        name: AppRoutes.afterPaymentView, 
        page: ()=> AfterPaymentView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => PaymentDetailViewModel());
        })),
        GetPage(
        name: AppRoutes.categoryItemDetailView, 
        page: ()=> CategoryItemDetailView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeViewModel());
          Get.lazyPut(() => FavoriteViewModel());
        })),
        GetPage(
        name: AppRoutes.bookingStarReviewView, 
        page: ()=> BookingStarReviewView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => BookingDetailViewModel());
        })),
        GetPage(
        name: AppRoutes.notificationView, 
        page: ()=> NotificationView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => NotificationViewModel());
        })),
        GetPage(
        name: AppRoutes.loginView, 
        page: ()=> LoginView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => LoginViewModel());
        })),
        GetPage(
        name: AppRoutes.signupView, 
        page: ()=> SignUpView(),
        transition: Transition.fade,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignUpViewModel());
        })),
  ];
}