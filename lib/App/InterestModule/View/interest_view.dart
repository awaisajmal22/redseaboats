import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/InterestModule/Services/interest_servies.dart';
import 'package:redseaboats/App/InterestModule/ViewModel/interest_view_model.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/Shimmer/shimmer.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import 'Component/interest_tile.dart';

class InterestView extends StatelessWidget {
   InterestView({super.key});
   final interestVM = Get.find<InterestViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        height: SizeConfig.heightMultiplier * 10,
        color: AppColor.white,
        child: appButton(
          butonWidth: SizeConfig.widthMultiplier * 100,
          voidCallback: (){
            Get.toNamed(AppRoutes.homeView);
          }, widget: appText(text: 'Get Started')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 25,
              width: SizeConfig.widthMultiplier * 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  appText(text: 'Pick Your Interest', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 3.0, fontWeight: FontWeight.normal),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  appText(text: 'Enhance Your Brand Potential With\nGiant Advertising Blimps', fontSize: SizeConfig.textMultiplier * 2.0, textColor: AppColor.textGrey, fontWeight: FontWeight.w400)
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 60,
              child: Obx(
                ()=> GridView.builder(
                  itemCount:interestVM.newInterestList.isNotEmpty ? interestVM.newInterestList.length : 6,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: SizeConfig.heightMultiplier * 2.0,
                  crossAxisSpacing: SizeConfig.widthMultiplier * 5.2,
                  crossAxisCount: 2
                  ), 
                itemBuilder: (context, index){
                  return interestVM.newInterestList.isNotEmpty ? interestTile(
                    voidCallback: (){
                      interestVM.newInterestList[index].isActive = !interestVM.newInterestList[index].isActive!;
                    },
                    title: interestVM.newInterestList[index].name!,
                    imageUrl: interestVM.newInterestList[index].photoUrl!,
                    check: interestVM.newInterestList[index].isActive!
                  
                  ) : shimmer(Widget: shimmerinterestTile());
                }),
              ))
          ],
        )),
    );
  }

 
}