import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/BookingModule/View/booking_view.dart';
import 'package:redseaboats/App/BottomNavBarModule/View/Component/top_indicator.dart';
import 'package:redseaboats/App/BottomNavBarModule/ViewModel/navBar_view_model.dart';
import 'package:redseaboats/App/ChatModule/View/chat_view.dart';
import 'package:redseaboats/App/HomeModule/Home/View/home_view.dart';
import 'package:redseaboats/App/NearbyModule/View/nearby_view.dart';
import 'package:redseaboats/App/ProfileModule/View/profile_view.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

class NavBarView extends StatelessWidget {
   NavBarView({super.key});
final navBarVM = Get.find<NavBarViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navBarVM.controller,
        children: [
          HomeView(),
          BookingView(),
          const NearByView(),
          ChatView(),
          const ProfileView(),

      ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff00001A).withOpacity(0.15),
              offset: const Offset(0, -5),
              blurRadius: 15
            )
          ]
        ),
        height: SizeConfig.heightMultiplier * 9,
        child: Material(
          child: TabBar(
            labelStyle: const TextStyle(
              fontSize: 8,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 8,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal
            ),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            unselectedLabelColor: AppColor.textGrey,
            labelColor: AppColor.parrotGreen,
            indicator: const CustomTabIndicator(),
            controller: navBarVM.controller,
            tabs: navBarVM.myTabs),
        ),
      )
    );
  }
}