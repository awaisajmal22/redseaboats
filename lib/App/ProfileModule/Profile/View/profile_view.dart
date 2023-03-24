import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/Common/AppBar/custom_AppBar.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import 'Component/logout_tile.dart';
import 'Component/profile_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: AssetImage('assets/splash/bg.png'), width: double.maxFinite, height: double.maxFinite,fit: BoxFit.cover,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
            child: customAppBar(title: 'Current Location', titleColor: AppColor.white),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 60,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 52,
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 0.9),
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      appText(text: 'Jessica Strike', textColor: AppColor.parrotGreen, fontSize: SizeConfig.textMultiplier * 2.45,),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3.0,
                      ),
                      profileTile(
                        title: 'Edit Profile',
                        voidCallback: (){
                          Get.toNamed(AppRoutes.editProfileView);
                        }
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 0.5,
                      ),
                      profileTile(
                        title: 'My Wallet', 
                      voidCallback: (){
                        Get.toNamed(AppRoutes.myWalletView);
                      }
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 0.5,
                      ),
                      profileTile(
                        title: 'Favorites', 
                        voidCallback: (){
                          Get.toNamed(AppRoutes.favoriteView);
                        }
                        ),
                         SizedBox(
                        height: SizeConfig.heightMultiplier * 0.5,
                      ),
                      profileTile(
                        title: 'Membership', 
                        voidCallback: (){
                          Get.toNamed(AppRoutes.membershipView);
                        }
                        ),
                         SizedBox(
                        height: SizeConfig.heightMultiplier * 0.5,
                      ),
                      profileTile(
                        title: 'Settings', 
                        voidCallback: (){
                          Get.toNamed(AppRoutes.settingsView);
                        }
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 0.5,
                        ),
                        logOutTile(title: 'Logout', voidCallback: (){})

                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    height: SizeConfig.heightMultiplier * 12.5,
                    width: SizeConfig.widthMultiplier * 26,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                        color: const Color(0xff000029).withOpacity(0.15),
                        offset: const Offset(0, 8),
                        blurRadius: 15
                        )
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.white,
                        width: 4
                      ),
                      image: const DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2017/07/24/19/57/tiger-2535888__340.jpg'), fit: BoxFit.cover)
                    ),
                  ) 
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

 
 
}