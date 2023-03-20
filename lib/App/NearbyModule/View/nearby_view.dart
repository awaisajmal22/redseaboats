import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redseaboats/Common/AppBar/custom_AppBar.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import 'Component/map_bottom_tile.dart';

class NearByView extends StatelessWidget {
  const NearByView({super.key});
  final LatLng _center = const LatLng(45.521563, -122.677433);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 91,
                child: GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(target: _center, zoom: 11.0)
                  )),
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
                    height: SizeConfig.heightMultiplier * 3.2,
                    child: customAppBar(title: 'Current Location')),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: SizeConfig.heightMultiplier * 2.0,
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier * 11.1,
                    width: SizeConfig.widthMultiplier * 100,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                      return mapBottomTile(
                        imageUrl: 'https://cdn.pixabay.com/photo/2016/11/14/04/36/boy-1822614__340.jpg',
                        title: 'Parasailing',
                        initialRating: 3,
                        onratingupdate: (value){

                        },
                        totalRating: '245',
                        locationName: 'Marina, Dubai'
                      );
                    }),
                  )
                )
            ],
          ),
            
        
      
    );
  }

  
}