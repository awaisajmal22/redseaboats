import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/OnBoardingModule/View/Component/next_page_button.dart';
import 'package:redseaboats/App/OnBoardingModule/ViewModel/onBoarding_view_model.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import 'Component/next_page_tile.dart';

class OnBoardingView extends StatelessWidget {
   OnBoardingView({super.key});
   final onBoardingVM = Get.find<OnBoardingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: onBoardingVM.pageController,
              onPageChanged: (value){
                onBoardingVM.selectedPageIndex.value  = value;
              },
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: onBoardingVM.onBoardingList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric( horizontal: 30),
          height: SizeConfig.heightMultiplier * 100,
          width: SizeConfig.widthMultiplier * 100,
          decoration:  BoxDecoration(
            image: DecorationImage(image: AssetImage(onBoardingVM.onBoardingList[index].imageUrl), fit: BoxFit.cover)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(text: onBoardingVM.onBoardingList[index].title, fontSize: SizeConfig.textMultiplier * 5.2, textColor: AppColor.textBlack),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.0,
              ),
              appText(text: onBoardingVM.onBoardingList[index].subtitle, fontSize: SizeConfig.textMultiplier * 2.0, textColor: AppColor.textGrey, textAlign: TextAlign.left),
            ],
          ),
        );
              }),
              Obx(
                ()=> nextPageTile(
                  skipVoidCallback: (){},
                  nextPageCallback: (){
                    onBoardingVM.getToNextPage();
                  },
                  pageIndex: onBoardingVM.selectedPageIndex.value,
                  pagesLength: onBoardingVM.onBoardingList.length
                ),
              )
          ],
        )
      ),
    );
  }

}