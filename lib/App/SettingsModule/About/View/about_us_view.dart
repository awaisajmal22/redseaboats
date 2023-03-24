import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redseaboats/App/SettingsModule/About/ViewModel/about_us_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../Common/Tiles/custom_about_tile.dart';

class AboutUsView extends StatelessWidget {
  AboutUsView({super.key});
  final aboutUsVM = AboutUsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'About Us'),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 3.9),
        itemCount: aboutUsVM.aboutUsList.length,
        itemBuilder: (context, index){
          return customAboutTile(title: aboutUsVM.aboutUsList[index].title, description: aboutUsVM.aboutUsList[index].description);
      }),
    );
  }

  
}