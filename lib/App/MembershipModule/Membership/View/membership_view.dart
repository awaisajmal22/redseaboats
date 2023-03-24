import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

class MembershipView extends StatelessWidget {
  const MembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(imageFilter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
          child: const Image(image: AssetImage('assets/splash/bg.png'), fit: BoxFit.cover,width: double.maxFinite, height: double.maxFinite,),
          ),
          Column(
            children: [
              customAppBar2(title: 'Membership', titleColor: AppColor.white ),
             SizedBox(
               height: SizeConfig.heightMultiplier * 7.5,
             ),
             appText(text: 'Red Sea', fontSize: SizeConfig.textMultiplier * 4.0),
             SizedBox(
               height: SizeConfig.heightMultiplier * 3.0,
             ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 8),
               child: appText(text: 'Get cashback of up to 20% for every ticket that you buy and spend it on future experiences!',maxLines: 10,
               fontSize: SizeConfig.textMultiplier * 2.0,
               fontWeight: FontWeight.w400
               ),
             ),
             Lottie.asset('assets/profile/icons/priceBox.json'),
             SizedBox(
              height: SizeConfig.heightMultiplier * 10.3,
             ),
             Padding(
               padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 6.4
               ),
               child: appButton(
                voidCallback: (){
                  Get.toNamed(AppRoutes.membershipDetailView);
                }, widget: appText(
                  text: 'How does it work?', 
                  fontSize: SizeConfig.textMultiplier * 2.0
                  ),
                  butonWidth: SizeConfig.widthMultiplier * 100,
                  buttonHeight: SizeConfig.heightMultiplier * 6.8
                  ),
             )
            ],
          ),
        ],
      ),
    );
  }
}