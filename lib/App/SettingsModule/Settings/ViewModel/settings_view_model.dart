import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/SettingsModule/Settings/Model/swtich_model.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';

class SettingsViewModel extends GetxController with GetSingleTickerProviderStateMixin{
 RxList<SwitchModel> switchList = <SwitchModel>[
  SwitchModel(check: false.obs, title: 'Notifications'),
  SwitchModel(check: false.obs, title: 'Promotional Messages'),
  SwitchModel(check: false.obs, title: 'Promotional Emails'),
 ].obs;

 
}