import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/MembershipModule/MembershipDetail/ViewModel/membership_detail_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import 'Component/membership_tier_tile.dart';

class MembershipDetailView extends StatelessWidget {
  MembershipDetailView({super.key});
  final membershipDetailVM = Get.find<MembershipDetailViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(1),
      appBar:  customAppBar2(title: 'Membership Detail'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 3.0),
        children: [
          appText(text: 'What is Red Sea membership?', fontSize: SizeConfig.textMultiplier * 2.24, textColor: AppColor.textBlack, textAlign: TextAlign.left),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          appText(
            maxLines: 100,
            textAlign: TextAlign.left,
            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            fontSize: SizeConfig.textMultiplier * 1.6,
            fontWeight: FontWeight.w400,
            textColor: AppColor.textGrey
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          appText(text: 'Red Sea Membership has 3 levels:', fontSize: SizeConfig.textMultiplier * 2.24, textColor: AppColor.textBlack, textAlign: TextAlign.left),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Column(
            children: List.generate(membershipDetailVM.membershipTierList.length, 
            (index) => Obx(
                ()=> membershipTierTile(
                  description: membershipDetailVM.membershipTierList[index].description,
                  imageUrl: membershipDetailVM.membershipTierList[index].imageUrl,
                  discount: membershipDetailVM.membershipTierList[index].discount,
                  title:membershipDetailVM.membershipTierList[index].title,
                  subtitile: membershipDetailVM.membershipTierList[index].subtitile,
                  voidCallback: (){
                    membershipDetailVM.membershipTierList[index].check.value = !membershipDetailVM.membershipTierList[index].check.value;
                  },
                  check: membershipDetailVM.membershipTierList[index].check.value
                ),
              ),)
          )
        ],
      ),
    );
  }

  
}