import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/InterestModule/ViewModel/interest_view_model.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

class InterestView extends StatelessWidget {
   InterestView({super.key});
   final interestVM = Get.find<InterestViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        alignment: Alignment.center,
        height: SizeConfig.heightMultiplier * 10,
        color: AppColor.textGrey,
        child: appButton(
          voidCallback: (){}, widget: appText(text: 'Get Started')),
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
                  appText(text: 'Enhance Your Brand Potential With Giant Advertising Blimps', fontSize: SizeConfig.textMultiplier * 2.0, textColor: AppColor.textGrey, fontWeight: FontWeight.w400)
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: interestVM.interestList.length,
              padding: EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: SizeConfig.heightMultiplier * 2.0,
                crossAxisSpacing: SizeConfig.widthMultiplier * 5.2,
                crossAxisCount: 2
                ), 
              itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(image: NetworkImage(interestVM.interestList[index].imageUrl), fit: BoxFit.cover)
                  ),
                 
                );
              }))
          ],
        )),
    );
  }
}