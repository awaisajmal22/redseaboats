import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redseaboats/Common/Shimmer/shimmer.dart';
import 'package:redseaboats/common/AppColors/app_colors.dart';

import '../../HomeModule/Home/Model/home_model.dart';
import '../../HomeModule/Home/Services/home_services.dart';

class NearbyViewModel extends GetxController {
  RxInt selectedLocation = 0.obs;
  final initialCameraPosition =
      const CameraPosition(target: LatLng(55.1986012, 25.1522944), zoom: 11.0);
  GoogleMapController? googleMapController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(
    seconds: 1
  ), ()=> getLocationData());
    getMarkerLocation();
  }

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  var dataModel = DataModel().obs;
  RxList<Marker> markerList = <Marker>[].obs;
void getLocationData() async {
    var data = await HomeServices().getDataModel();
    dataModel.value = data;
    
    //  print(data.data!.banners!.length);
  }
  void getMarkerLocation(
    
  ) async {
    final Uint8List icon = await getImages( 'assets/home/icons/marker.png', 100);
    final Uint8List icon2 = await getImages( 'assets/home/icons/myloc.png', 100);
    markerList = RxList.generate(
       dataModel.value.featuredServices != null ? dataModel.value.featuredServices!.length : 4,
        (index) => dataModel.value.featuredServices != null ? Marker(
            markerId: MarkerId(dataModel.value.featuredServices![index].id),
            icon: selectedLocation.value == index ?  BitmapDescriptor.fromBytes(icon2) : BitmapDescriptor.fromBytes(icon),
            position: LatLng(
                dataModel.value.featuredServices![index].location.location
                    .coordinates![0],
                dataModel.value.featuredServices![index].location.location
                    .coordinates![1])) : const Marker(markerId: MarkerId('1'))
    );
  }
  
}
