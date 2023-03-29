import 'package:flutter/material.dart';

import '../../../../../Common/AppText/appText.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget thirdPartyButton({
    required String title,
    required Color buttonColor,
    required IconData icon,
    required VoidCallback voidCallback
  }) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
                padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier * 10.0,
                  top: SizeConfig.heightMultiplier * 0.5,
                  bottom: SizeConfig.heightMultiplier * 0.5,
                  right: SizeConfig.heightMultiplier * 0.5,
                ),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Expanded(child: appText(
                      textAlign: TextAlign.left,
                      text: title, fontSize: SizeConfig.textMultiplier * 1.75, fontWeight: FontWeight.w500)),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                      height: SizeConfig.heightMultiplier * 5,
                      width: SizeConfig.widthMultiplier * 10,
                      child: Icon(icon, color: buttonColor,),
                    ),
                    
                  ],
                ),
              ),
    );
  }