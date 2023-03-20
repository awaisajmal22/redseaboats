import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingViewModel extends GetxController with GetSingleTickerProviderStateMixin{
  RxInt currentIndex = 0.obs;
  TabController? tabController;
  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Upcoming',
    ),
    Tab(
      text: 'Completed',
    )
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
  }
  @override
  void onClose() { 
    tabController!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}