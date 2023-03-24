import 'package:get/get.dart';
import 'package:redseaboats/App/MembershipModule/MembershipDetail/Model/membership_tier_model.dart';

class MembershipDetailViewModel extends GetxController{
   RxList<MembershipTierModel> membershipTierList = <MembershipTierModel>[
    MembershipTierModel(
      title: 'Bronze', 
      subtitile: 'Unlocked after your 1st purchase', 
      imageUrl: 'assets/membership/bronze.png',
       description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", 
       discount: '15',
       check: false.obs
       ),
        MembershipTierModel(
      title: 'Silver', 
      subtitile: 'Unlocked after your 1st purchase', 
      imageUrl: 'assets/membership/silver.png',
       description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", 
       discount: '15',
       check: false.obs
       ),
        MembershipTierModel(
      title: 'Gold', 
      subtitile: 'Unlocked after your 1st purchase', 
      imageUrl: 'assets/membership/gold.png',
       description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", 
       discount: '15',
       check: false.obs
       ),

  ].obs;
}