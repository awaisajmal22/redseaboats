import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:redseaboats/App/SettingsModule/TermsAndPolicies/ViewModel/terms_policies_view_model.dart';
import 'package:redseaboats/Common/Tiles/custom_about_tile.dart';

import '../../../../Common/AppBar/custom_appbar_2.dart';
import '../../../../Common/SizeConfig/size_config.dart';

class TermsAndPoliciesView extends StatelessWidget {
   TermsAndPoliciesView({super.key});
final termsPoliciesVM = TermsAndPoliciesViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Terms and Policies'),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, vertical: SizeConfig.heightMultiplier * 3.9),
        itemCount: termsPoliciesVM.termsPoliciesList.length,
        itemBuilder: (context, index){
          return customAboutTile(title: termsPoliciesVM.termsPoliciesList[index].title, description: termsPoliciesVM.termsPoliciesList[index].description);
      }),
    );
  }
}