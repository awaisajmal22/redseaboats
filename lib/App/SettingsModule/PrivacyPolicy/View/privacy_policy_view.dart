import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redseaboats/App/SettingsModule/PrivacyPolicy/ViewModel/privacy_policy_view_model.dart';

import '../../../../Common/AppBar/custom_appbar_2.dart';
import '../../../../Common/SizeConfig/size_config.dart';
import '../../../../Common/Tiles/custom_about_tile.dart';

class PrivacyPolicyView extends StatelessWidget {
   PrivacyPolicyView({super.key});
  final privacyPolicyVM = PrivacyPolicyViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Terms and Policies'),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 3.9),
        itemCount: privacyPolicyVM.privacyPolicyList.length,
        itemBuilder: (context, index){
          return customAboutTile(title: privacyPolicyVM.privacyPolicyList[index].title, description: privacyPolicyVM.privacyPolicyList[index].description);
      }),
    );
  }
}