import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/HomeModule/Home/View/Component/seeall_title_tile.dart';
import 'package:redseaboats/App/ProfileModule/MyWallet/ViewModel/mywallet_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import 'Component/avaliable_balance_tile.dart';
import 'Component/credit_card_tile.dart';

class MyWalletView extends StatelessWidget {
   MyWalletView({super.key});
   final myWalletVM = Get.find<MyWalletViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(1),
      appBar: customAppBar2(title: 'My Wallet'),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avalaibleBalanceTile(
              avalaibleBalance: '76.84'
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            appText(text: 'Payment Cards', fontSize: SizeConfig.textMultiplier * 2.0 , textColor: AppColor.textBlack),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            Column(
              children: List.generate(myWalletVM.cardList.length, (index) => Column(
                children: [
                  Obx(
                    ()=> creditCardTile(
                      title: myWalletVM.cardList[index].title,
                      index: index,
                      selectedIndex: myWalletVM.selectedCardIndex.value,
                      voidCallback: (){
                        myWalletVM.selectedCardIndex.value = index;
                      },
                              creditCardNumber:myWalletVM.cardList[index].cardNumber,
                              cardLogo: myWalletVM.cardList[index].imageUrl,
                  
                              ),
                  ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            )
                ],
              )),
            ),
            seeAllTitleTile(seeAllCallBack: (){}, title: 'Recent Payment', buttonTitle: 'View All'),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.0,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 34.886,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index){
                return recentPaymentTile(
                  date: '22 Oct, 2021',
                  price: '450',
                   title: 'Tom Curise'
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Container recentPaymentTile({
    required String date,
    required String price,
    required String title,
  }) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4.0, vertical: SizeConfig.heightMultiplier * 1.4),
                margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2.0),
                height: SizeConfig.heightMultiplier * 8.0,
                width: SizeConfig.widthMultiplier * 100,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.shadow5D.withOpacity(0.15),
                      offset: Offset(0, 8),
                      blurRadius: 15
                    ),
                    
                  ]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/profile/icons/bannerdown.png'), fit: BoxFit.cover,),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 4.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText(text: date, textColor: AppColor.textGrey, fontWeight:  FontWeight.w500, fontSize: SizeConfig.textMultiplier * 1.5),
                            appText(text: title, textColor: AppColor.textBlack, fontWeight:  FontWeight.w700, fontSize: SizeConfig.textMultiplier * 1.75),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                       
                        appText(text: '- ', textColor: AppColor.red, fontSize: SizeConfig.textMultiplier * 1.75),
                        appText(text: 'AED $price', textColor: AppColor.textBlack, fontSize: SizeConfig.textMultiplier * 1.75)
                      ],
                    )
                  ],
                ),
              );
  }

  
}