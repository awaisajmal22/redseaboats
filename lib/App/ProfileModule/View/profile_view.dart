import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redseaboats/Common/AppBar/custom_AppBar.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(image: AssetImage('assets/splash/bg.png'), width: double.maxFinite, height: double.maxFinite,fit: BoxFit.cover,),
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
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    )
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
                        color: Color(0xff000029).withOpacity(0.15),
                        offset: Offset(0, 8),
                        blurRadius: 15
                        )
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.white,
                        width: 4
                      ),
                      image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2017/07/24/19/57/tiger-2535888__340.jpg'), fit: BoxFit.cover)
                    ),
                  ) 
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}