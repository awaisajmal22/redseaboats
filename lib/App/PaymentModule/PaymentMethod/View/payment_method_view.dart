import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/PaymentModule/PaymentMethod/ViewModel/payment_method_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../RoutesAndBindings/app_routes.dart';

class PaymentMehtodView extends StatelessWidget {
  PaymentMehtodView({super.key});
final paymentMethodVM = Get.find<PaymentMethodViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Payment Mehtod'),
      body: ListView.builder(
        itemCount: paymentMethodVM.paymentMethodList.length,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5.0,
          vertical: SizeConfig.heightMultiplier * 3.0
        ),
        itemBuilder: (context, index){
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.paymentDetailView);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 5.0,
                    vertical: SizeConfig.heightMultiplier * 2.0
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.shadow5D.withOpacity(0.15),
                        offset: Offset(0, 8),
                        blurRadius: 15
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(image: AssetImage(paymentMethodVM.paymentMethodList[index].iconUrl), width: SizeConfig.widthMultiplier * 5.0,
                      height: SizeConfig.heightMultiplier * 1.8,),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 3.5,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          appText(
                            text: paymentMethodVM.paymentMethodList[index].title, fontSize: SizeConfig.textMultiplier * 2.0, textColor: AppColor.textBlack),
                          appText(text: paymentMethodVM.paymentMethodList[index].subtitle, fontSize: SizeConfig.textMultiplier * 1.5, textColor: AppColor.textGrey)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3.0,
              )
            ],
          );
        },
      ),
    );
  }
}