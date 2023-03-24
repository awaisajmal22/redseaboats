import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../Common/AppColors/app_colors.dart';
import '../../../../../Common/SizeConfig/size_config.dart';

Widget locationTile({
    required LatLng currentLocation
  }) {
    return Container(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.heightMultiplier * 2.0,
                  left: SizeConfig.widthMultiplier * 3.0,
                  right: SizeConfig.widthMultiplier * 3.0
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.shadowColor1A.withOpacity(0.15),
                      offset: Offset(0, 8),
                      blurRadius: 15
                    )
                  ]
                ),
                height: SizeConfig.heightMultiplier * 21.8,
                width: SizeConfig.widthMultiplier * 100,
                child: GoogleMap( 
                   mapType: MapType.normal,
                zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(target: currentLocation, zoom: 11.0)
                  ),
              );
  }

  
