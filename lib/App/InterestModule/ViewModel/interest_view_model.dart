import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:redseaboats/App/InterestModule/Model/interest_model.dart';
import 'package:redseaboats/App/InterestModule/Services/interest_servies.dart';

import '../../../Network/api_services.dart';
import '../../../Network/api_url.dart';

class InterestViewModel extends GetxController{
  // RxList<InterestModel2> interestList = <InterestModel2>[
  //   InterestModel2(imageUrl: 'https://cdn.pixabay.com/photo/2023/03/04/15/08/rabbit-7829706__340.png', title: 'Attractions', check: false.obs),
  //   InterestModel2(imageUrl: 'https://cdn.pixabay.com/photo/2023/03/08/18/22/berries-7838482_640.jpg', title: 'Tours', check: false.obs),
  //   InterestModel2(imageUrl: 'https://cdn.pixabay.com/photo/2023/03/11/10/42/plants-7844173_640.jpg', title: 'Day Trips', check: false.obs),
  //   InterestModel2(imageUrl: 'https://cdn.pixabay.com/photo/2023/02/23/19/30/bird-7809491__340.jpg', title: 'Outdoor Activities', check: false.obs),
  //   InterestModel2(imageUrl: 'https://cdn.pixabay.com/photo/2023/03/03/08/22/skulls-7827155_640.jpg', title: 'Food & Drink', check: false.obs),
  //   InterestModel2(imageUrl: 'https://cdn.pixabay.com/photo/2023/02/11/10/34/ai-generated-7782437_640.jpg', title: 'Events', check: false.obs),
  //   InterestModel2(imageUrl: 'https://cdn.pixabay.com/photo/2023/02/10/07/59/fox-7780326__340.jpg', title: 'Cruises', check: false.obs),
  //   InterestModel2(imageUrl: 'https://cdn.pixabay.com/photo/2023/01/07/10/02/leaves-7702922__340.jpg', title: 'Water Sports', check: false.obs),
  // ].obs;

  @override
  void onInit() {
   
    // TODO: implement onInit
    super.onInit();
   Future.delayed(Duration(seconds: 1), ()=> fetchinginterestData());
  }
 RxList<InterestDataModel> newInterestList = <InterestDataModel>[].obs;
 
 void fetchinginterestData() async {
  List<InterestDataModel> data = await InterestServices().getInterest();
  newInterestList.value = data;
 }


//
}