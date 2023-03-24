import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/BookingModule/Complaint/ViewModel/complaint_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../Common/FormField/custom_formfield.dart';

class ComplaintView extends StatelessWidget {
   ComplaintView({super.key});
final complaintVM = Get.find<ComplaintViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(1),
      appBar: customAppBar2(title: 'Complaint'),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 3.5,
          horizontal: SizeConfig.widthMultiplier * 5.0
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: appText(
              textAlign: TextAlign.left,
              textColor: AppColor.textGrey,
              fontWeight: FontWeight.w400,
              text: 'Please fill out the information, our CSR will contact you.'),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier* 3.0,
          ),
          Container(
              alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
            // height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
            color: AppColor.whiteFC. withOpacity(0.95),
            borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customFormField(
                  isObsecure: (){},
                  validator: (value){},
                  suffixIcon: Icon(null),
                 controller: complaintVM.firstNameController, 
                  hintText: 'First Name'
                  ),
                Container(
                  height: 1,
                  width: SizeConfig.widthMultiplier * 100,
                  color: AppColor.textGrey.withOpacity(0.20),
                ),
                customFormField(
                  isObsecure: (){},
                  validator: (value){},
                  suffixIcon: Icon(null),
                 controller: complaintVM.secondNameController,
                 hintText:  'Last Name'
                 )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Container(
              alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
            // height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
            color: AppColor.whiteFC. withOpacity(0.95),
            borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customFormField(
                  isObsecure: (){},
                  validator: (value){},
                  suffixIcon: Icon(null),
                 controller: complaintVM.emailController, 
                  hintText: 'Email Address'
                  ),
                Container(
                  height: 1,
                  width: SizeConfig.widthMultiplier * 100,
                  color: AppColor.textGrey.withOpacity(0.20),
                ),
                customFormField(
                  isObsecure: (){},
                  validator: (value){},
                  suffixIcon: Icon(null),
                 controller: complaintVM.phoneController,
                 hintText:  'Phone Number'
                 ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.0,
          ),
          Container(
              alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
            // height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
            color: AppColor.whiteFC. withOpacity(0.95),
            borderRadius: BorderRadius.circular(8)
            ),
            child: customFormField(
              maxLines: 5,
                  isObsecure: (){},
                  validator: (value){},
                  suffixIcon: Icon(null),
                 controller: complaintVM.emailController, 
                  hintText: 'Your Message'
                  ),
          ),
           SizedBox(
                    height: SizeConfig.heightMultiplier * 4.0,
                  ),
          Padding(padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 2,
          ),
          child: appButton(
            butonWidth: SizeConfig.widthMultiplier * 100,
            buttonHeight: SizeConfig.heightMultiplier * 6.8,
            buttonColor: AppColor.parrotGreen,
            voidCallback: (){}, widget: appText(text: 'Submit', fontSize: SizeConfig.textMultiplier * 2.0)),
          )
        ],
      ),
    );
  }
}