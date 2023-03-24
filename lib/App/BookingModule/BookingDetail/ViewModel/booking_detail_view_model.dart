import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/Model/amenities_model.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/Model/booking_ticket_info_model.dart';
import 'package:redseaboats/App/BookingModule/BookingDetail/Model/reason_model.dart';

class BookingDetailViewModel extends GetxController{
 final LatLng googleMapInitialPosition = const LatLng(45.521563, -122.677433);
 final reasonController = TextEditingController();
 List<AmenitiesModel> amenitiesList = <AmenitiesModel>[
  AmenitiesModel(name: 'AC', imageUrl: 'assets/booking/icons/ac.png'),
  AmenitiesModel(name: 'Wifi', imageUrl: 'assets/booking/icons/Wifi.png'),
  AmenitiesModel(name: 'Transport', imageUrl: 'assets/booking/icons/Parking.png'),
  AmenitiesModel(name: 'TV', imageUrl: 'assets/booking/icons/TV.png'),
  AmenitiesModel(name: 'Beverages', imageUrl: 'assets/booking/icons/firdge.png'),
 ];

 RxList<ReasonModel> reasonList = <ReasonModel>[
ReasonModel(check: false.obs, title: 'Morbi sed turpis nec turpis.'),
ReasonModel(check: false.obs, title: 'Aliquam eu risus ultrices, rhoncu.'),
ReasonModel(check: false.obs, title: 'Aliquam eu risus ultrices, rhoncu.'),
ReasonModel(check: false.obs, title: 'Aliquam eu risus ultrices, rhoncu.'),
ReasonModel(check: false.obs, title: 'Other'),
 ].obs;
}