import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redseaboats/App/ProfileModule/EditProfile/Model/bottom_sheet_model.dart';

class EditProfileViewModel extends GetxController{
  final firstNameController  = TextEditingController();
  final lastNameController  = TextEditingController();
  final emailController  = TextEditingController();
  final phoneController  = TextEditingController();

  List<BottomSheetModel> bottomSheetList = <BottomSheetModel>[
     BottomSheetModel(title: 'Take a photo', leadingIcon: 'assets/profile/icons/cam2.png'),
    BottomSheetModel(title: 'Your Photo', leadingIcon: 'assets/profile/icons/Image.png'),
    BottomSheetModel(title: 'Delete current photo', leadingIcon: 'assets/profile/icons/Delete.png'),
  ];

  RxString image = ''.obs;
  final pickedImage = ImagePicker();
  Future getImageFormCamera() async {
    final selectedImage = await pickedImage.pickImage(source: ImageSource.camera);
    if(selectedImage != null){
      image.value = selectedImage.path;
    }
  }
  Future getImageFormStorage() async {
    final selectedImage = await pickedImage.pickImage(source: ImageSource.gallery);
    if(selectedImage != null){
      image.value = selectedImage.path;
    }
  }

  deleteImage(){
    image.value = '';
  }
}