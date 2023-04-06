import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redseaboats/App/NearbyModule/ViewModel/nearby_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_AppBar.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/Shimmer/shimmer.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import 'Component/map_bottom_tile.dart';

class NearByView extends StatelessWidget {
   NearByView({super.key});
  final nearByVM = Get.find<NearbyViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 91,
                child: Obx(
                  ()=> GoogleMap(
                        // ignore: invalid_use_of_protected_member
                        markers: Set<Marker>.of(nearByVM.markerList.value),
                        mapType: MapType.normal,
                        zoomControlsEnabled: false,
                        initialCameraPosition: nearByVM.initialCameraPosition,
                          onMapCreated: (controller) {
                            nearByVM.googleMapController = controller;
                          },
                        ),
                ),
                ),
                
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
                    height: SizeConfig.heightMultiplier * 3.2,
                    child: customAppBar(title: 'Current Location')),
                ),
                Positioned(
                  bottom: SizeConfig.heightMultiplier * 15.2,
                  right: SizeConfig.widthMultiplier * 5.0,
                  child: Container(
                    alignment: Alignment.center,
                    height: SizeConfig.heightMultiplier * 7.0,
                    width: SizeConfig.widthMultiplier * 14.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.white
                    ),
                    child: const Icon(FontAwesomeIcons.locationCrosshairs, color: AppColor.parrotGreen,),
                  ),
                  
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: SizeConfig.heightMultiplier * 2.0,
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier * 11.1,
                    width: SizeConfig.widthMultiplier * 100,
                    child: Obx(
                      ()=> ListView.builder(
                        padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: nearByVM.dataModel.value.featuredServices!= null ? nearByVM.dataModel.value.featuredServices!.length : 4,
                        itemBuilder: (context, index) {
                          var data = nearByVM.dataModel.value.featuredServices;
                        return data != null ?  mapBottomTile(
                          voidCallback: () async {
                            nearByVM.getMarkerLocation();
                             nearByVM.selectedLocation.value = index;
                             
                            nearByVM.googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
                              CameraPosition(
                                zoom: 11.0,
                                target: LatLng(
                                data[index].location.location.coordinates![0],
                                 data[index].location.location.coordinates![1]
                                 ))
                            ));
                           
                            print(nearByVM.markerList.length);
                            print(nearByVM.dataModel.value.featuredServices![index].location.location.coordinates![0]);               
                            print(nearByVM.dataModel.value.featuredServices![index].location.location.coordinates![1]);               
                          },
                          imageUrl: data[index].location.photoUrl,
                          title: data[index].location.title,
                          initialRating: data[index].rating.toDouble(),
                          onratingupdate: (value){
                    
                          },
                          totalRating: data[index].totalRating.toString(),
                          locationName: data[index].location.streetAddress
                        ) : shimmer(Widget: shimmerMapBottomTile());
                      }),
                    ),
                  )
                )
            ],
          ),
            
        
      
    );
  }

  
}