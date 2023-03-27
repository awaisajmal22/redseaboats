import 'package:flutter/material.dart';

Widget appText({
required String text,
TextOverflow textOverFlow = TextOverflow.visible,
Color textColor = Colors.white,
double fontSize = 16,
TextAlign textAlign = TextAlign.center,
FontWeight fontWeight = FontWeight.w700,
String fontFamily = 'Poppins',
int maxLines = 3,
FontStyle fontStyle = FontStyle.normal,
TextDecoration textDecoration = TextDecoration.none


}){
  return Text(
    maxLines: maxLines,
    overflow: textOverFlow,
    textAlign: textAlign,
    text,
    style: TextStyle(
      decoration: textDecoration,
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontStyle: fontStyle
    ),
  );
}