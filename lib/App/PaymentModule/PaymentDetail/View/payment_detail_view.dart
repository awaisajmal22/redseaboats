import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/PaymentModule/PaymentDetail/ViewModel/payment_detail_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import 'component/name_and_expirey_tile.dart';

class PaymentDetailView extends StatelessWidget {
  PaymentDetailView({super.key});
final paymentDetailVM = Get.find<PaymentDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Payment Details'),
      body: ListView(
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 25,
            width: SizeConfig.widthMultiplier * 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: SizeConfig.widthMultiplier * -15,
                    child: Container(
                      height: SizeConfig.heightMultiplier * 13,
                      width: SizeConfig.widthMultiplier * 20,
                      decoration: BoxDecoration(
                          color: AppColor.parrotGreen.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    )),
                Positioned(
                    left: SizeConfig.widthMultiplier * -17,
                    child: Container(
                      height: SizeConfig.heightMultiplier * 17,
                      width: SizeConfig.widthMultiplier * 20,
                      decoration: BoxDecoration(
                          color: AppColor.parrotGreen.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    )),
                Positioned(
                    right: SizeConfig.widthMultiplier * -15,
                    child: Container(
                      height: SizeConfig.heightMultiplier * 13,
                      width: SizeConfig.widthMultiplier * 20,
                      decoration: BoxDecoration(
                       
                          color: AppColor.parrotGreen.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    )),
                Positioned(
                    right: SizeConfig.widthMultiplier * -17,
                    child: Container(
                      height: SizeConfig.heightMultiplier * 17,
                      width: SizeConfig.widthMultiplier * 20,
                      decoration: BoxDecoration(
                          color: AppColor.parrotGreen.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    )),

                    Container(
                      height: SizeConfig.heightMultiplier * 20,
                      width: SizeConfig.widthMultiplier * 83,
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 1.7,
                        horizontal: SizeConfig.widthMultiplier * 5.0
                      ),
                      decoration: BoxDecoration(
                         boxShadow: [
                          BoxShadow(
                            color: AppColor.parrotGreen.withOpacity(0.45),
                            offset: const Offset(0, 8),
                            blurRadius: 15
                          )
                        ],
                        color: AppColor.parrotGreen,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              appText(text: 'Red Sea', fontSize: SizeConfig.textMultiplier * 2.25),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 2.0,
                              ),
                              
                            ],
                          ),
                          appText(
                            text: '**** **** **** ****', fontSize: SizeConfig.textMultiplier * 2.6, fontWeight: FontWeight.w500),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                nameAndExpiryTile(
                                  title: 'Card Holder Name',
                                  subtitle: 'Muhammad Umer'
                                ),
                                nameAndExpiryTile(title: 'Expiry Date', subtitle: '02 / 20'),

                              ],
                            )
                        ],
                      )
                    )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 7.0),
            child: Column(
              children: [
                Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5.0
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.white,
                  border: Border.all(
                    color: const Color(0xffE6E6E6),
                    width: 1
                  )
                ),
                 child: paymentFormField(
                  controller: paymentDetailVM.cardNameController,
                  hintText: 'Name on Card'
                 )
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.6,
                ),
                Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5.0
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.white,
                  border: Border.all(
                    color: const Color(0xffE6E6E6),
                    width: 1
                  )
                ),
                 child: Row(
                  children: [
                    Expanded(
                      child: paymentFormField(
                                      controller: paymentDetailVM.cardNumberController,
                                      hintText: 'Card Number'
                                     ),
                    ),
                 SizedBox(
                  width: SizeConfig.widthMultiplier * 3.0,
                 ),
                 Image(image: AssetImage('assets/profile/icons/card.png'), height: SizeConfig.heightMultiplier * 3.0,)
                  ],
                 )
                ),
                 SizedBox(
                  height: SizeConfig.heightMultiplier * 2.6,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 5.0
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.white,
                        border: Border.all(
                          color: const Color(0xffE6E6E6),
                          width: 1
                        )
                      ),
                       child:  paymentFormField(
                                            controller: paymentDetailVM.cardExpiryController,
                                            hintText: 'Expiry Date'
                                           ),
                          ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 5.0,
                    ),
                    Expanded(
                      child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.widthMultiplier * 5.0
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColor.white,
                                      border: Border.all(
                      color: const Color(0xffE6E6E6),
                      width: 1
                                      )
                                    ),
                                     child: Row(
                                      children: [
                      Expanded(
                        child: paymentFormField(
                                        controller: paymentDetailVM.cardCVVController,
                                        hintText: 'CVV'
                                       ),
                      ),
                                     
                                     Icon(FontAwesomeIcons.question, size: SizeConfig.heightMultiplier * 1.5,)
                                      ],
                                     )
                                    ),
                    ),
                     
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5.0,
                ),
                appButton(
                  butonWidth: SizeConfig.widthMultiplier * 100,
                  buttonHeight:  SizeConfig.heightMultiplier * 6.8,
                  voidCallback: (){
                    Get.toNamed(AppRoutes.afterPaymentView);
                  },
                 widget: appText(text: 'Pay Now', fontSize: SizeConfig.textMultiplier * 2.0)),
                 SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                 ),
                 appButton(
                  buttonColor: AppColor.white,
                  butonWidth: SizeConfig.widthMultiplier * 100,
                  buttonHeight:  SizeConfig.heightMultiplier * 6.8,
                  voidCallback: (){
                    Get.back();
                  },
                 widget: appText(text: 'Cancel',textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 2.0))
                 
              ],
            ),
          )
         
        ],
      ),
    );
  }

  Widget paymentFormField({
    required String hintText,
    required TextEditingController controller
  }) {
    return  TextFormField(
                
                  controller: controller,
                  cursorColor: AppColor.cursorColor,
                  style: TextStyle(
                    color: AppColor.textGrey,
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    fontFamily: 'Poppins',
                  ),
                             decoration:  InputDecoration(
                             
                              hintText: hintText,
                              hintStyle: TextStyle(
                    color: AppColor.textGrey,
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    fontFamily: 'Poppins',
                  ),
                               border: InputBorder.none
                             ),
                           
               );
  }

 
}
