import 'package:flutter/material.dart';

import '../../../../../../Common/AppColors/app_colors.dart';
import '../../../../../../Common/AppText/appText.dart';
import '../../../../../../Common/SizeConfig/size_config.dart';

Widget homeAppBar({
    required String title
  }) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
                  automaticallyImplyLeading: false,
                  title: appText(text: title, fontSize: SizeConfig.textMultiplier * 1.8, fontWeight: FontWeight.w500),
                  backgroundColor: AppColor.transparent,
                  actions: [
                    Container(
                      height: SizeConfig.heightMultiplier * 3.2,
                      width: SizeConfig.widthMultiplier * 7.4,
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/home/icons/Noti.png'), fit: BoxFit.contain)
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 2.0,
                    ),
                      Container(
                      height: SizeConfig.heightMultiplier * 3.2,
                      width: SizeConfig.widthMultiplier * 7.4,
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/home/icons/alert.png'), fit: BoxFit.contain)
                      ),
                      ),
                       SizedBox(
                      width: SizeConfig.widthMultiplier * 2.0,
                    ),
                      Container(
                      height: SizeConfig.heightMultiplier * 3.2,
                      width: SizeConfig.widthMultiplier * 7.4,
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/10990278/pexels-photo-10990278.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'), fit: BoxFit.cover)
                      ),
                      )
                    
                  ],
                );
  }