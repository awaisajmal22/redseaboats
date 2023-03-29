import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/SplashModule/ViewModel/splash_view_model.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

class SplashView extends StatelessWidget {
   SplashView({super.key});
  final splashVM = Get.find<SplashViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Obx(
      ()=> Stack(
        fit: StackFit.expand,
        children:  [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: splashVM.animate.value ? 0 : -30,
            right: splashVM.animate.value ? 0 : -30,
            top: splashVM.animate.value ? 0 : -30,
            bottom: splashVM.animate.value ? 0 : -30,
            child: const Image(image: AssetImage('assets/splash/bg.png'), fit: BoxFit.cover,)
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DelayedDisplay(
                    delay: const Duration(seconds: 3),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.onBoardingView);
                        },
                        child: appText(text: 'Skip for Now', textAlign: TextAlign.right, fontSize: SizeConfig.textMultiplier * 2.0))),
                  ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DelayedDisplay(
            delay: const Duration(seconds: 2),
            slidingBeginOffset: const Offset(-1.0, 0.0),
           
            fadingDuration: const Duration(seconds: 1),
            child: appText(text: 'Red Sea', fontSize: SizeConfig.textMultiplier * 5.2, textAlign: TextAlign.left),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.0,
          ),
          DelayedDisplay(
            delay: const Duration(seconds: 2),
            slidingBeginOffset: const Offset(-1.0, 0.0),
           
            fadingDuration: const Duration(seconds: 1),
            child: appText(
              text: 'Travel the text offers biblical study trips to the\nlands of the bible.', 
              fontSize: SizeConfig.textMultiplier * 1.8,
              fontWeight: FontWeight.w400, 
              textAlign: TextAlign.justify,
              textOverFlow: TextOverflow.visible
              ),
              
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          DelayedDisplay(
            delay: const Duration(seconds: 3),
            slidingBeginOffset: const Offset(0.0, 1.0),
            fadingDuration: Duration(seconds: 1),
            child: Column(
              children: [
                appButton(voidCallback: (){
                  Get.toNamed(AppRoutes.loginView);
                }, widget: appText(text: 'Sign In', fontSize: SizeConfig.textMultiplier * 2.0 ), buttonHeight: SizeConfig.heightMultiplier * 6.0, butonWidth: SizeConfig.widthMultiplier * 100),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                ),
                appButton(voidCallback: (){}, widget: appText(text: 'Sign Up',fontSize: SizeConfig.textMultiplier * 2.0, textColor: AppColor.textBlack), buttonColor: AppColor.white, buttonHeight: SizeConfig.heightMultiplier * 6.0, butonWidth: SizeConfig.widthMultiplier * 100),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.9,
                )
              ],
            ),
          )
          
          
                      ],
                    )
                ],
                          ),
                      
              )),
           
        ],
      ),
    )
    );
  }
}