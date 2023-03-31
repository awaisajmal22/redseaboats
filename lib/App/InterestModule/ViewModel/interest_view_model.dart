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
// Rx<InterestModel>? interestModel = InterestModel().obs;

  @override
  void onInit() {
   
    // TODO: implement onInit
    super.onInit();
     getInterest();
   
  }
RxList<InterestModel> dataList = <InterestModel>[].obs;
// ignore: non_constant_identifier_names

Future<void> getInterest() async {

try{
  var response = await API().getRequest(GetApiUrl.interest);
  
  if(response.statusCode == 200){
    print(response.data);
    final List<dynamic>  data = response.data;
   this.dataList.assignAll( data.map((json) => InterestModel.fromJson(json.data["data"])).toList());
  }else if(response.statusCode == 401){
    
    print('Expire');
  }else {
    throw Exception('Failed to load users');
  }
} catch (e){}
}
// List<InterestModel> get interestData => dataList.toList();
//   Future<void> loadData() async {
//     final interest = storage.read('interest');
//     if(interest != null){
//       final List<dynamic> interestList = interest;
//       dataList.assignAll(interestList.map((element) => InterestModel.fromJson(element as Map<String, dynamic>)).toList());

//     }
//   }
}