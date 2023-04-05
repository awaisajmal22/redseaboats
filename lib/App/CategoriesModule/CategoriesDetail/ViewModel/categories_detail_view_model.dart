import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/CategoriesModule/CategoriesDetail/Model/expact_model.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';

import '../../../BookingModule/BookingDetail/Model/amenities_model.dart';

class CategoriesDetailViewModel extends GetxController{
  RxInt selectedDurationIndex = 0.obs;

  List durationList = [
    '30',
    '60',
    '90',
    '120',
    '150'
  ];

  List<AmenitiesModel> amenitiesList = <AmenitiesModel>[
  AmenitiesModel(name: 'AC', imageUrl: 'assets/booking/icons/ac.png'),
  AmenitiesModel(name: 'Wifi', imageUrl: 'assets/booking/icons/Wifi.png'),
  AmenitiesModel(name: 'Transport', imageUrl: 'assets/booking/icons/Parking.png'),
  AmenitiesModel(name: 'TV', imageUrl: 'assets/booking/icons/TV.png'),
  AmenitiesModel(name: 'Beverages', imageUrl: 'assets/booking/icons/firdge.png'),
 ];
List<ExpactModel> expactList = <ExpactModel>[
  ExpactModel(check: true, title: 'Use of snorkelling equipment'),
  ExpactModel(check: true, title: 'Air-conditioned Vehicle '),
  ExpactModel(check: true, title: 'Private trasnportation'),
  ExpactModel(check: false, title: 'Foto'),

];

final ScrollController controller = ScrollController();

// This is what you're looking for!
void scrollDown() {
  controller.animateTo(
    controller.position.maxScrollExtent,
    duration: Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
  );
}
}