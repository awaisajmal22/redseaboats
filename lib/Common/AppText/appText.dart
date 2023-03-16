import 'package:flutter/material.dart';

Widget appText({
required String text,
TextOverflow textOverFlow = TextOverflow.visible,
Color textColor = Colors.white,
double fontSize = 16,
TextAlign textAlign = TextAlign.center,
FontWeight fontWeight = FontWeight.w600,
String fontFamily = 'Poppins',



}){
  return Text(
    overflow: textOverFlow,
    textAlign: textAlign,
    text,
    style: TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily
    ),
  );
}