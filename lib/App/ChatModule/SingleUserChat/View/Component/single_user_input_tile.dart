import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget singleUserInputTile({
  required VoidCallback cameravoidCallback,
  required VoidCallback recordingvoidCallback,
  required VoidCallback sendvoidCallback,
  required TextEditingController controller,
}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 5.0,
        vertical: SizeConfig.heightMultiplier * 1.0),
    height: SizeConfig.heightMultiplier * 10,
    decoration: BoxDecoration(
        color: AppColor.white.withOpacity(1),
        border: Border(
            top: BorderSide(
                color: AppColor.textGrey.withOpacity(0.15), width: 2))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.whiteFC,
                borderRadius: BorderRadius.circular(18)),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5.0, vertical: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: AppColor.cursorColor,
                    controller: controller,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xffBCBCBC),
                        fontSize: SizeConfig.textMultiplier * 1.25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            right: SizeConfig.widthMultiplier * 5.0,
                            top: 0,
                            bottom: 0),
                        hintText: 'Write a message',
                        hintStyle: TextStyle(
                            color: Color(0xffBCBCBC),
                            fontSize: SizeConfig.textMultiplier * 1.25,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: AppColor.whiteFC,
                        border: InputBorder.none),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: cameravoidCallback,
                      child: Icon(
                        FontAwesomeIcons.camera,
                        color: Color(0xffBCBCBC),
                        size: SizeConfig.imageSizeMultiplier * 4,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 3.0,
                    ),
                    GestureDetector(
                      onTap: recordingvoidCallback,
                      child: Icon(
                        FontAwesomeIcons.microphone,
                        color: Color(0xffBCBCBC),
                        size: SizeConfig.imageSizeMultiplier * 4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.widthMultiplier * 1.9,
        ),
        GestureDetector(
          onTap: sendvoidCallback,
          child: Icon(
            Icons.send,
            color: AppColor.parrotGreen,
          ),
        )
      ],
    ),
  );
}
