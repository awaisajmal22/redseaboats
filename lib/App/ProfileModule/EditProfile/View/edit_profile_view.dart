import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/ProfileModule/EditProfile/View/Component/edit_profile_bottom_sheet.dart';
import 'package:redseaboats/App/ProfileModule/EditProfile/ViewModel/edit_profile_view_model.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../Common/AppBar/custom_appbar_2.dart';
import 'Component/edit_profile_formfield.dart';
import 'Component/edit_profile_picture_tile.dart';

class EditProfileView extends StatelessWidget {
   EditProfileView({super.key});
final editProfileVM = Get.find<EditProfileViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(1),
      appBar: customAppBar2(
        title: 'Edit Profile'
      ),
      body: ListView(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0,),
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 5.9,
        ),
       appText(text: 'Edit your personal information here...', fontSize: SizeConfig.textMultiplier * 2.0,textAlign: TextAlign.left, textColor: AppColor.textGrey, fontWeight: FontWeight.w400),
        
        SizedBox(
          height: SizeConfig.heightMultiplier * 3.5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              ()=> editProfilePicTile(
                imageUrl: editProfileVM.image.value,
                voidCallback: (){
                  editProfileBottomSheet(
                  data: editProfileVM.bottomSheetList,
                  fromGallery: (){
                    editProfileVM.getImageFormStorage();
                  },
                  fromCamera: (){
                    editProfileVM.getImageFormCamera();
                  },
                  delete: (){
                    editProfileVM.deleteImage();
                  }
                );
                }
            
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.5,
            ),
            Container(
              alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
            height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
            color: AppColor.whiteFC. withOpacity(0.95),
            borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                editProfileFormField(
                 controller: editProfileVM.firstNameController, 
                  hintText: 'Jessica'
                  ),
                Container(
                  height: 1,
                  width: SizeConfig.widthMultiplier * 100,
                  color: AppColor.textGrey.withOpacity(0.20),
                ),
                editProfileFormField(
                 controller: editProfileVM.lastNameController,
                 hintText:  'Strike'
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
            height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
            color: AppColor.whiteFC. withOpacity(0.95),
            borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                editProfileFormField(
                  controller: editProfileVM.emailController, 
                 hintText: 'Jessica.strike@gmail.com'
                  ),
                Container(
                  height: 1,
                  width: SizeConfig.widthMultiplier * 100,
                  color: AppColor.textGrey.withOpacity(0.20),
                ),
                editProfileFormField(
                  controller: editProfileVM.phoneController,
                  hintText: '+971 50 1234 567',
                  textInputAction: TextInputAction.done,
                  keyBoeardType: TextInputType.phone
                  )
              ],
            ),
          ),
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 5.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1.4),
          child: appButton(
            radius: 6,
            voidCallback: (){}, 
            widget: appText(text: 'Update Profile',
             fontSize: SizeConfig.textMultiplier * 2.0), 
             butonWidth: SizeConfig.widthMultiplier * 100,
             buttonHeight: SizeConfig.heightMultiplier * 6.8
             ),
             
             
        )
      ],
      ),
    );
  }
  
}