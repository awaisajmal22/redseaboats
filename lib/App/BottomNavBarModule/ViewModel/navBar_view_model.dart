import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class NavBarViewModel extends GetxController with GetTickerProviderStateMixin{
  RxInt currentIndex = 0.obs;

 TabController? controller;

final List<Tab> myTabs = <Tab>[
  const Tab(
    icon: ImageIcon(AssetImage('assets/navbar/home.png'), size: 24,),
    text: 'Home',
    
  ),
  const Tab(
    icon: ImageIcon(AssetImage('assets/navbar/calender.png'), size: 24,),
    text: 'Bookings',
    
  ),
  const Tab(
    icon: ImageIcon(AssetImage('assets/navbar/location.png'), size: 24,),
    text: 'Nearby',
    
  ),
  const Tab(
    icon: ImageIcon(AssetImage('assets/navbar/chat.png'), size: 24,),
    text: 'Chat',
    
  ),
  const Tab(
    icon: ImageIcon(AssetImage('assets/navbar/profile.png'), size: 24,),
    text: 'Profile',
    
  ),

];
RxString selectedTitle = 'About Us'.obs;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = TabController(length: myTabs.length, vsync: this);
  }
  @override
  void onClose() { 
    controller!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}