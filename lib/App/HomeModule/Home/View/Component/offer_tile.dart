import 'package:flutter/material.dart';

import '../../../../../Common/SizeConfig/size_config.dart';

Widget offersTile({
    required int index,
    required int length,
    required String imageUrl
    }) {
    return Container(
                  margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 5.3),
            height: SizeConfig.heightMultiplier * 11,
            width: SizeConfig.widthMultiplier * 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)
            ),
                );
  }