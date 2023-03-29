import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/NotificationModule/ViewModel/notification_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});
  final notificationVM = Get.find<NotificationViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Notifications'),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5.0),
          itemCount: notificationVM.notificationList.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1.0,
                ),
                appText(
                    text: notificationVM.notificationList[index].date,
                    textColor: AppColor.textBlack,
                    fontSize: SizeConfig.textMultiplier * 2.5,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1.0,
                ),
                Column(
                  children: List.generate(
                      notificationVM
                          .notificationList[index].notification.length,
                      (ind) => Column(
                            children: [
                              Container(
                                width: SizeConfig.widthMultiplier * 100,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.widthMultiplier * 5.0,
                                    vertical:
                                        SizeConfig.heightMultiplier * 2.0),
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.15),
                                          offset: const Offset(0, 8),
                                          blurRadius: 32)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText(
                                        text: notificationVM
                                            .notificationList[index]
                                            .notification[ind]
                                            .title,
                                        textColor: AppColor.parrotGreen,
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.9,
                                        fontWeight: FontWeight.w500),
                                    SizedBox(
                                      height: SizeConfig.heightMultiplier * 0.7,
                                    ),
                                    appText(
                                        text: notificationVM
                                            .notificationList[index]
                                            .notification[ind]
                                            .subtitle,
                                        textColor: AppColor.textGrey,
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.5,
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 2.0,
                              )
                            ],
                          )),
                )
              ],
            );
          }),
    );
  }
}
