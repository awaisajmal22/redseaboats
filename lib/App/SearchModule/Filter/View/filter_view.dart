import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/SearchModule/Filter/ViewModel/filter_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import 'Component/filter_tile.dart';

class FilterView extends StatelessWidget {
  FilterView({super.key});
  final filterVM = Get.find<FilterViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(1),
      appBar: customAppBar2(title: 'Filters'),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 3.9,
          horizontal: SizeConfig.widthMultiplier * 5.0,
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
                text: 'Services',
                textColor: AppColor.textBlack,
                fontSize: SizeConfig.textMultiplier * 2.24),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Wrap(
              spacing: SizeConfig.widthMultiplier * 1.4,
              runSpacing: SizeConfig.heightMultiplier * 0.8,
              alignment: WrapAlignment.spaceEvenly,
              direction: Axis.horizontal,
              children: List.generate(
                growable: true,
                filterVM.servicesList.length,
                (index) => Obx(
                  () => filterTile(
                      title: filterVM.servicesList[index],
                      index: index,
                      voidCallback: () {
                        filterVM.selectedserviceIndex.value = index;
                      },
                      selectedIndex: filterVM.selectedserviceIndex.value),
                ),
              )),
          SizedBox(
            height: SizeConfig.heightMultiplier * 5.4,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
                text: 'Location',
                textColor: AppColor.textBlack,
                fontSize: SizeConfig.textMultiplier * 2.24),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.0,
          ),
          Wrap(
              spacing: SizeConfig.widthMultiplier * 1.4,
              runSpacing: SizeConfig.heightMultiplier * 0.8,
              alignment: WrapAlignment.spaceEvenly,
              direction: Axis.horizontal,
              children: List.generate(
                growable: true,
                filterVM.locationList.length,
                (index) => Obx(
                  () => filterTile(
                      title: filterVM.locationList[index],
                      index: index,
                      voidCallback: () {
                        filterVM.selectedLocationIndex.value = index;
                      },
                      selectedIndex: filterVM.selectedLocationIndex.value),
                ),
              )),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4.7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 0.8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  text: 'Price range',
                  textColor: AppColor.textBlack,
                  fontSize: SizeConfig.textMultiplier * 3),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          
        ],
      ),
    );
  }
}
