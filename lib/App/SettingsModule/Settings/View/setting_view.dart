import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/SettingsModule/Settings/View/Component/switch_tile.dart';
import 'package:redseaboats/App/SettingsModule/Settings/ViewModel/settings_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import 'Component/settings_tile.dart';

class SettingsView extends StatelessWidget {
   SettingsView({super.key});
   final settingsVM = Get.find<SettingsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Settings'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 4.8),
        children: [
          settingsTile(voidCallback: (){
            Get.toNamed(AppRoutes.changePasswordView);
          }, title: 'Change Password'),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Column(
            children: List.generate(settingsVM.switchList.length, (index) => Column(
              children: [
                Obx(
                  ()=> switchTile(
                    activeColor: index == 1 ? Colors.orange.withOpacity(0.5) : AppColor.parrotGreen,
                    onChanged: (value){
                      settingsVM.switchList[index].check.value = value!;
                    }, 
                    title: settingsVM.switchList[index].title, 
                    value: settingsVM.switchList[index].check.value
                    ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                )
              ],
            )
              ),
              
          ),
          settingsTile(voidCallback: (){
            Get.toNamed(AppRoutes.aboutUsView);
          }, title: 'About Us'),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          settingsTile(voidCallback: (){
            Get.toNamed(AppRoutes.termsandPoliciesView);
          }, title: 'Terms and Policies'),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          settingsTile(voidCallback: (){
            Get.toNamed(AppRoutes.privacyPolicyView);
          }, title: 'Privacy Policy'),
        ],
        )
    );
  
  }

  
}