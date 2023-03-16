import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

class EnableLocationView extends StatelessWidget {
  const EnableLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: SizeConfig.heightMultiplier * 50,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/onBoarding/loc.png'), fit: BoxFit.fitWidth)
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5.0,
            ),
            DelayedDisplay(
              slidingBeginOffset: Offset.fromDirection(-2.0,10),
              fadingDuration: Duration(seconds: 1),
              slidingCurve: Curves.linear,
              child: appText(text: "See what's available\naround you", textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.75,fontWeight: FontWeight.w500, textAlign: TextAlign.center)),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.2,
              ),
              DelayedDisplay(
              slidingBeginOffset: Offset.fromDirection(-1.0,10),
              fadingDuration: Duration(seconds: 1),
              slidingCurve: Curves.linear,
              child: appText(text: "Enjoy your favorite water sports with\nyour love ones.", textColor: AppColor.textGrey, fontSize: SizeConfig.textMultiplier * 2.0,fontWeight: FontWeight.w400, textAlign: TextAlign.center)),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: appButton(
                  buttonHeight: SizeConfig.heightMultiplier * 6.8,
                  butonWidth: SizeConfig.widthMultiplier * 100,
                  voidCallback: (){
                    Get.offAllNamed(AppRoutes.interestView);
                  }, widget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(FontAwesomeIcons.solidPaperPlane, color: AppColor.white,size: SizeConfig.imageSizeMultiplier * 5.0,),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 4.0,
                    ),
                    appText(text: 'Enable Location', fontSize: SizeConfig.textMultiplier * 2.0, fontWeight: FontWeight.w600),
                   
                  ],
                )),
              ),
               SizedBox(
                      height: SizeConfig.heightMultiplier * 3.0,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: appText(text: "Don't Allow",textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.0),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    )
          ],
        )),
    );
  }
}