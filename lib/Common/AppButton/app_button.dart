import 'package:flutter/material.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';

Widget appButton(
  {
    required VoidCallback voidCallback,
    double buttonHeight = 50,
    double butonWidth = 100,
    double radius = 6,
    Color buttonColor = AppColor.parrotGreen,
    required Widget widget,
    Alignment buttonWidgetAlignment = Alignment.center,
    Color borderColor = AppColor.transparent

  }
){
  return GestureDetector(
    onTap: voidCallback,
    child: Container(
      alignment: buttonWidgetAlignment,
      height: buttonHeight,
      width: butonWidth,
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(
          color: borderColor,
          width: 2
        ),
        borderRadius: BorderRadius.circular(radius)
      ),
      child: widget,
    ),
  );
}