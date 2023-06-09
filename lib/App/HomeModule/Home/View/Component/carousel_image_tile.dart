 import 'package:flutter/material.dart';
import 'package:redseaboats/common/AppColors/app_colors.dart';

import '../../../../../../Common/SizeConfig/size_config.dart';

Widget carouselImageTile({
    required String imageUrl
  }) {
    return Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 45,
                decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                  ),
                  image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                ),
                
              );
  }

  Widget shimmercarouselImageTile() {
    return Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 45,
                decoration:  const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                  ),
                ),
                
              );
  }