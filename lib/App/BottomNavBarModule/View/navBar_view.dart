import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/BottomNavBarModule/View/Component/top_indicator.dart';
import 'package:redseaboats/App/BottomNavBarModule/ViewModel/navBar_view_model.dart';
import 'package:redseaboats/App/HomeModule/Home/View/home_view.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';

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
          HomeView(),
          HomeView(),
          HomeView(),
          HomeView(),

      ]),
      bottomNavigationBar: Material(
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
          indicator: CustomTabIndicator(),
          controller: navBarVM.controller,
          tabs: navBarVM.myTabs),
      )
    );
  }
}