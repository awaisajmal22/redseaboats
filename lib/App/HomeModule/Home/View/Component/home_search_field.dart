import 'package:flutter/material.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

Widget homeSearchField(
  {
    required VoidCallback filterCallBack,
    required TextEditingController controller,
    required String hintText
  }
){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4.5, ),
    
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColor.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 15,
          offset: const Offset(0, 8),
          color: const Color(0xff00001A).withOpacity(0.1)
        )
      ]
    ),
    child: TextFormField(
      controller: controller,
      cursorColor: AppColor.textGrey,
      style: TextStyle(
        fontSize: SizeConfig.textMultiplier * 1.8,
        color: AppColor.textGrey,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400
      ),
      textAlign: TextAlign.left,
      decoration:  InputDecoration(
      
        hintText: hintText,
        hintStyle: TextStyle(
        fontSize: SizeConfig.textMultiplier * 1.8,
        color: AppColor.textGrey,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400
      ),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 3.8,
              width: SizeConfig.widthMultiplier * 7.4,
              decoration: BoxDecoration(
                color: AppColor.parrotGreen,
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(image: AssetImage('assets/home/icons/search.png'), fit: BoxFit.cover)
              ),
              
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 4.5,
            )
          ],
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              
              height: SizeConfig.heightMultiplier * 3.8,
              width: SizeConfig.widthMultiplier * 0.3,
              color: AppColor.textGrey.withOpacity(0.3),
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 5.0,
            ),
            GestureDetector(
              onTap: filterCallBack,
              child: ImageIcon(AssetImage('assets/home/icons/slider.png'), color: AppColor.textGrey,))
          ],
        ),
        fillColor: AppColor.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.transparent
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.transparent
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.transparent
          ),
          borderRadius: BorderRadius.circular(10)
        )
      ),
    ),
  );
}