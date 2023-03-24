import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/HomeModule/Home/ViewModel/home_view_model.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../RoutesAndBindings/app_routes.dart';
import 'Component/search_tile.dart';

class SearchView extends StatelessWidget {
   SearchView({super.key});
  final homeVM = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.parrotGreen,
      body: SafeArea(
          child: Column(
        children: [
          searchTile(
            filterCallBack: (){
              Get.toNamed(AppRoutes.filterView);
            },
            controller: homeVM.searchController2,
            searchCallback: (){
              if(homeVM.searchController.text != '') {
                homeVM.searchList.add(homeVM.searchController2.text);
              }
            }
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ), 
          Expanded(
            child: Container(
                width: SizeConfig.widthMultiplier * 100,
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5.0,
                  vertical: SizeConfig.heightMultiplier * 3.0
                ),
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: appText(text: 'Recent searches', fontWeight:  FontWeight.w500, textColor: AppColor.textGrey, fontSize: SizeConfig.textMultiplier * 1.75)),
                  if (homeVM.searchList.isEmpty) const SizedBox.shrink() else Obx(
                    ()=> Column(
                        children: List.generate(homeVM.searchList.length, (index) => recentSearchTile(
                        
                           removeCallback: (){
                            homeVM.searchList.remove(homeVM.searchList[index]);
                           },
                           title: homeVM.searchList[index]
                        )
                        ),
                      ),
                  )
                  ],
                ),
              ),
          )
        ],
      )),
    );
  }

 Widget recentSearchTile(
    {
      required VoidCallback removeCallback,
      required String title
    }
  ) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
            
        ),
        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
              FontAwesomeIcons.clock, color: AppColor.textGrey,
              size: SizeConfig.imageSizeMultiplier * 3.2,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 3.0,
            ),
            appText(
              text: title,
             fontSize: SizeConfig.textMultiplier * 1.75, 
             fontWeight: FontWeight.w500,
             textAlign: TextAlign.left, 
             textColor: AppColor.textBlack)
              ],
            ),
            GestureDetector(
              onTap: removeCallback,
              child: Icon(Icons.close, size: SizeConfig.imageSizeMultiplier * 3.2, color: AppColor.textGrey,))
            
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2.0,
        ),
        Container(
          height: 1,
          width: SizeConfig.widthMultiplier * 100,
          color: AppColor.textGrey.withOpacity(0.3),
        )
      ],
    );
  }

 
}
